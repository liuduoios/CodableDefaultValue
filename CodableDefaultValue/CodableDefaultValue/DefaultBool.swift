//
//  DefaultBool.swift
//  HappyCodable
//
//  Created by liuduo on 2022/8/29.
//

import Foundation

@propertyWrapper
public struct DefaultBool: Codable {
    public var wrappedValue: Bool
    
    public init(wrappedValue: Bool) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(Bool.self)) ?? Bool.defaultValue
    }
    
    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

public extension KeyedDecodingContainer {
    func decode(_ type: DefaultBool.Type, forKey key: Key) throws -> DefaultBool {
        try decodeIfPresent(type, forKey: key) ?? DefaultBool(wrappedValue: Bool.defaultValue)
    }
}
