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

public extension HCaptchaSwift.Client {

    /// Response from verification endpoint
    ///
    /// See API [documentation](https://docs.hcaptcha.com/?utm_source=docs3#verify-the-user-response-server-side)
    struct VerifyResponse: Decodable, ErrorCodeReceiving {
        
        /// Key definitions for the responses
        enum CodingKeys: String, CodingKey {
            case success
            case challenge_ts
            case hostname
            case credit
            case error_codes = "error-codes"
            case score
        }
        
        /// Is the passcode valid, and does it meet security criteria you specified, e.g. sitekey?
        let success: Bool
        
        /// Timestamp of the challenge (ISO format yyyy-MM-dd'T'HH:mm:ssZZ)
        let challenge_ts: String
        
        /// The hostname of the site where the challenge was solved
        let hostname: String

        /// Optional: whether the response will be credited
        let credit: Bool?
        
        /// Optional: any error codes
        let error_codes: [String]?
        
        /// ENTERPRISE feature: a score denoting malicious activity
        let score: Float?
        
        /// ENTERPRISE feature: reason(s) for score. - missing due to lack of documentation.
        //let score_reason: [Any]?
    }

}

