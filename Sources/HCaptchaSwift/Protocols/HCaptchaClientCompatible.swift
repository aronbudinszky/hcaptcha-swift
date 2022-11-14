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

/// Defines how the public client's interface should look like
public protocol HCaptchaClientCompatible {
    
    /// Verify the user's response server-side
    ///
    /// - Parameters:
    ///  - hCaptchaResponse: The verification token you received when the user completed the captcha on your site.
    ///  - remoteIp: The user's IP address. Optional.
    ///  - siteKey: The sitekey you expect to see. Optional, but recommended.
    ///
    /// - Throws: Throws an error if something failed.
    /// - Returns: Returns true when the verification is successful, false otherwise.
    func verify(_ hCaptchaResponse: String, remoteIp: String?, siteKey: String?) async throws -> Bool
}
