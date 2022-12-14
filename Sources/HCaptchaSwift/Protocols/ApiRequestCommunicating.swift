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

/// Defines the typical functions for API communication
protocol ApiRequestCommunicating {
    
    /// The server-side secret
    var secret: String { get }
        
    /// Send a GET network request to an endpoint
    ///
    /// - Parameter object: The request model object
    /// - Parameter endpoint: The endpoint to connect to
    /// - Returns: Returns the response model object.
    func get<RequestObject: RequestResponsePairing, ResponseObject: Decodable>(_ object: RequestObject, to endpoint: HCaptchaSwift.Constants.Endpoint) async throws -> ResponseObject where ResponseObject == RequestObject.ResponseType
    
    /// Send a POST network request to an endpoint
    ///
    /// - Parameter object: The request model object
    /// - Parameter endpoint: The endpoint to connect to
    /// - Returns: Returns the response model object.
    func post<RequestObject: RequestResponsePairing, ResponseObject: Decodable>(_ object: RequestObject, to endpoint: HCaptchaSwift.Constants.Endpoint) async throws -> ResponseObject where ResponseObject == RequestObject.ResponseType
}
