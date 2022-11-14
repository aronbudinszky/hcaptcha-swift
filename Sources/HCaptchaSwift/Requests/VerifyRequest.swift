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

extension HCaptchaSwift.Client {
    
    /// Request for verifying a user.
    ///
    /// See API [documentation](https://docs.hcaptcha.com/?utm_source=docs3#verify-the-user-response-server-side)
    struct VerifyRequest: Codable, RequestResponsePairing {

        /// Create a url-encoded version that we can pass as request body
        var urlEncodedData: Data? {
            var dict: [String: String] = [
                "secret": self.secret,
                "response": self.response
            ]
            if let remoteip = self.remoteip {
                dict["remoteip"] = remoteip
            }
            if let sitekey = self.sitekey {
                dict["sitekey"] = sitekey
            }
            
            let queryString = dict.reduce("") { str, element in
                let queryStrValue = element.value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                return "\(str)&\(element.key)=\(queryStrValue)"
            }
            return queryString.data(using: .utf8)
        }
        
        
        typealias ResponseType = VerifyResponse
        
        // MARK: - Properties
        
        /// The account secret key
        let secret: String
        
        /// The verification token you received when the user completed the captcha on your site.
        let response: String
        
        /// The remote IP address of the user, optional
        let remoteip: String?
        
        /// Site key, optional but recommended
        let sitekey: String?

    }
}
