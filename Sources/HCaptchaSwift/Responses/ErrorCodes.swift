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

    /// Possible error codes returned by the HCaptcha API
    ///
    /// See API [documentation](https://docs.hcaptcha.com/#siteverify-error-codes-table)
    enum ErrorCode: String, Decodable {
        
        /// Your secret key is missing.
        case missingInputSecret = "missing-input-secret"
        
        /// Your secret key is invalid or malformed.
        case invalidInputSecret = "invalid-input-secret"
        
        /// The response parameter (verification token) is missing.
        case missingInputResponse = "missing-input-response"
        
        /// The response parameter (verification token) is invalid or malformed.
        case invalidInputResponse = "invalid-input-response"
        
        /// The request is invalid or malformed.
        case badRequest = "bad-request"
        
        /// The response parameter has already been checked, or has another issue.
        case invalidOrAlreadySeenResponse = "invalid-or-already-seen-response"
        
        /// You have used a testing sitekey but have not used its matching secret.
        case notUsingDummyPasscode = "not-using-dummy-passcode"
        
        /// The sitekey is not registered with the provided secret.
        case sitekeySecretMismatch = "sitekey-secret-mismatch"
        
        /// Unknown error
        case unknown
    }

}
