//
//  IntValue.swift
//  HappyCodable
//
//  Created by liuduo on 2022/8/28.
//

import Foundation

@propertyWrapper
public struct DefaultInt: Codable {
    public var wrappedValue: Int
    
    public init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(Int.self)) ?? Int.defaultValue
    }
    
    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

public extension KeyedDecodingContainer {
    func decode(_ type: DefaultInt.Type, forKey key: Key) throws -> DefaultInt {
        try decodeIfPresent(type, forKey: key) ?? DefaultInt(wrappedValue: Int.defaultValue)
    }
}
