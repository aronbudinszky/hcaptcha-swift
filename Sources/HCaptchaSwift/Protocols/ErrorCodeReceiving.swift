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

// MARK: - Definition

/// Defines a response that receives an error code
protocol ErrorCodeReceiving {
    
    /// The returned error codes
    ///
    /// If empty, no errors were reported
    var error_codes: [String]? { get }
    
    /// Returns the more descriptive array of `ErrorCode` enums associated with the current error codes
    var errors: [HCaptchaSwift.Client.ErrorCode]? { get }
    
}

// MARK: - Implementation

/// Implementation
extension ErrorCodeReceiving {
    
    var errors: [HCaptchaSwift.Client.ErrorCode]? {
        
        return self.error_codes?.map({
            HCaptchaSwift.Client.ErrorCode(rawValue: $0) ?? .unknown
        })
    }
}
