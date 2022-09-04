//
//  DefaultUInt.swift
//  HappyCodable
//
//  Created by 刘铎 on 2022/8/29.
//

import Foundation

@propertyWrapper
public struct DefaultUInt: Codable {
    public var wrappedValue: UInt
    
    public init(wrappedValue: UInt) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(UInt.self)) ?? UInt.defaultValue
    }
    
    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

public extension KeyedDecodingContainer {
    func decode(_ type: DefaultUInt.Type, forKey key: Key) throws -> DefaultUInt {
        try decodeIfPresent(type, forKey: key) ?? DefaultUInt(wrappedValue: UInt.defaultValue)
    }
}
