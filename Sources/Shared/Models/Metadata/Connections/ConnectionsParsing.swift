//
//  ConnectionsParsing.swift
//  VimeoNetworking
//
//  Created by Balatbat, Bryant on 7/30/18.
//  Copyright © 2019 Vimeo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

protocol ConnectionsParsing: MetadataParsing {
    
    /// An `associatedtype` that will need to be defined as an enum `String`
    associatedtype ConnectionKeys: MetadataKeys where ConnectionKeys.RawValue == String
    
    /// Given `Metadata`, parses it into a dictionary of `ConnectionKeys` to `VIMConnection`
    ///
    /// - Parameter metadata: `Metadata` to be parsed
    /// - Returns: `Dictionary` that maps `ConnectionKeys` to `VIMConnection`
    func parse(_ metadata: Metadata) -> [ConnectionKeys: VIMConnection]
    
    /// Mapping used in cases where the connection key maps to a subclass of `VIMConnection`
    var connectionMapping: [ConnectionKeys: VIMConnection.Type] { get }
}

extension ConnectionsParsing {
    func parse(_ metadata: Metadata) -> [ConnectionKeys: VIMConnection] {
        return parse(metadata, type: .connections, mapping: connectionMapping)
    }
}
