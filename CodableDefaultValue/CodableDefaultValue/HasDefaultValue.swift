//
//  DefaultValue.swift
//  HappyCodable
//
//  Created by liuduo on 2022/8/28.
//

import Foundation
import UIKit

public protocol HasDefaultValue {
    associatedtype Value: Codable
    static var defaultValue: Value { get set }
}

extension String: HasDefaultValue {
    public static var defaultValue = ""
}

extension Int: HasDefaultValue {
    public static var defaultValue = 0
}

extension UInt: HasDefaultValue {
    public static var defaultValue: UInt = 0
}

extension Bool: HasDefaultValue {
    public static var defaultValue = false
}
