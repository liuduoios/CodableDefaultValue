//
//  DefaultBaseType.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/9/4.
//

import Foundation

@propertyWrapper
public struct DefaultBaseType<BaseType: Codable & HasDefaultValue>: Codable {
    public var wrappedValue: BaseType
    
    public init() {
        wrappedValue = BaseType.defaultValue
    }
    
    public init(wrappedValue: BaseType) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(BaseType.self)) ?? BaseType.defaultValue
    }
    
    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

public extension KeyedDecodingContainer {
    func decode<BaseType: Codable & HasDefaultValue>(_ type: DefaultBaseType<BaseType>.Type, forKey key: Key) throws -> DefaultBaseType<BaseType> {
        try decodeIfPresent(type, forKey: key) ?? DefaultBaseType(wrappedValue: BaseType.defaultValue)
    }
}



