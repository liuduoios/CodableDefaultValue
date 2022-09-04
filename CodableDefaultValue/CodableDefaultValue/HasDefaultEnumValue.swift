//
//  HasDefaultEnumValue.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/8/29.
//

import Foundation

public protocol HasDefaultEnumValue {
    associatedtype Value: RawRepresentable where Value.RawValue == Int
    static var defaultValue: Value { get set }
}
