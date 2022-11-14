//
// (c) Aron Budinszky (2022) - https://aron.budinszky.me
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

import Foundation

public extension HCaptchaSwift {
    
    /// The `Client` allows you to connect to HCaptcha's API and perform supported operations
    ///
    /// Usage:
    ///
    ///         let hCaptchaClient = HCaptchaSwift.Client(secret: "- your server secret -")
    ///         let result = await hCaptchaClient.verify(....)
    ///
    struct Client: HCaptchaClientCompatible {
        
        // MARK: - Type definitions
        
        public enum Error: Swift.Error {
            case hCaptchaError(errors: [ErrorCode])
        }
        
        
        // MARK: - Properties
        
        /// The underlying API client
        private let apiClient: ApiRequestCommunicating
        
        // MARK: - Methods

        /// Create a new `Client`
        ///
        /// - Parameter secret: The server-side secret for this site.
        public init(secret: String) {
            self.init(apiClient: ApiClient(secret: secret))
        }

        /// Create a new `Client` with a custom `APIClient`. Can be used for testing.
        ///
        /// - Parameter apiClient: The underlying API Client
        init(apiClient: ApiRequestCommunicating) {
            self.apiClient = apiClient
        }
     
        // MARK: - Protocol conformance
        
        public func verify(_ hCaptchaResponse: String, remoteIp: String?, siteKey: String?) async throws -> Bool {
            
            let request = VerifyRequest(secret: self.apiClient.secret, response: hCaptchaResponse, remoteip: remoteIp, sitekey: siteKey)
            let response = try await self.apiClient.post(request, to: .verify)
            
            // If there are any errors, throw
            if let errors = response.errors {
                throw Error.hCaptchaError(errors: errors)
            }
            
            return response.success
        }

    }
    
}
