//
//  DefaultObject.swift
//  HappyCodable
//
//  Created by liuduo on 2022/8/29.
//

import Foundation

@propertyWrapper
public struct DefaultObject<ObjectType: Codable & EmptyInitializable>: Codable {
    public var wrappedValue: ObjectType
    
    public init(wrappedValue: ObjectType) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(ObjectType.self)) ?? ObjectType()
    }
    
    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

public extension KeyedDecodingContainer {
    func decode<ObjectType: EmptyInitializable>(_ type: DefaultObject<ObjectType>.Type, forKey key: Key) throws -> DefaultObject<ObjectType> {
        try decodeIfPresent(type, forKey: key) ?? DefaultObject(wrappedValue: ObjectType())
    }
}
