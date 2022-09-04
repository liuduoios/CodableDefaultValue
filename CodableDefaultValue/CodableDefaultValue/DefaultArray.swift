//
//  DefaultArray.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/8/29.
//

import Foundation

@propertyWrapper
public struct DefaultArray<Value: Codable>: Codable {
    public var wrappedValue: [Value]
    
    public init() {
        wrappedValue = []
    }
    
    public init(wrappedValue: [Value]) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var results = [Value]()
        while !container.isAtEnd {
            let value = try container.decode(Value.self)
            results.append(value)
        }
        wrappedValue = results
    }
    
    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

public extension KeyedDecodingContainer {
    func decode<Value>(_ type: DefaultArray<Value>.Type, forKey key: Key) throws -> DefaultArray<Value> {
        try decodeIfPresent(type, forKey: key) ?? DefaultArray(wrappedValue: [])
    }
}
