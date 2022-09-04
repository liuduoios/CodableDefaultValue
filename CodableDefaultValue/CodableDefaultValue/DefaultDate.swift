//
//  DefaultDate.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/8/29.
//

import Foundation

@propertyWrapper
public struct DefaultDate: Codable {
    public var wrappedValue: Date
    
    public init(wrappedValue: Date) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(Date.self)) ?? Date(timeIntervalSinceReferenceDate: 0)
    }
    
    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

public extension KeyedDecodingContainer {
    func decode(_ type: DefaultDate.Type, forKey key: Key) throws -> DefaultDate {
        try decodeIfPresent(type, forKey: key) ?? DefaultDate(wrappedValue: Date(timeIntervalSinceReferenceDate: 0))
    }
}
