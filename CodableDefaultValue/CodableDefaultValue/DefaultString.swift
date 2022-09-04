//
//  StringValue.swift
//  HappyCodable
//
//  Created by liuduo on 2022/8/28.
//

import Foundation

@propertyWrapper
public struct DefaultString: Codable {
    public var wrappedValue: String
    
    public init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(String.self)) ?? String.defaultValue
    }
    
    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

public extension KeyedDecodingContainer {
    func decode(_ type: DefaultString.Type, forKey key: Key) throws -> DefaultString {
        try decodeIfPresent(type, forKey: key) ?? DefaultString(wrappedValue: String.defaultValue)
    }
}
