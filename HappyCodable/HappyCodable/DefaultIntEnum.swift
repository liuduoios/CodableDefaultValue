//
//  RawValueType.swift
//  HappyCodable
//
//  Created by liuduo on 2022/8/28.
//

import Foundation

@propertyWrapper
public struct DefaultIntEnum<Value: RawRepresentable & HasDefaultEnumValue>: Codable where Value.RawValue == Int {
    private var intValue = Value.defaultValue.rawValue
    
    public var wrappedValue: Value {
        get { Value(rawValue: intValue)! }
        set { intValue = newValue.rawValue }
    }
    
    public init() {
        
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        intValue = (try? container.decode(Int.self)) ?? Value.defaultValue.rawValue
    }
    
    public func encode(to encoder: Encoder) throws {
        try intValue.encode(to: encoder)
    }
}

public extension KeyedDecodingContainer {
    func decode<Value: RawRepresentable>(_ type: DefaultIntEnum<Value>.Type, forKey key: Key) throws -> DefaultIntEnum<Value> {
        try decodeIfPresent(DefaultIntEnum<Value>.self, forKey: key) ?? DefaultIntEnum()
    }
}
