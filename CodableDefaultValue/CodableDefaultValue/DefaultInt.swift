//
//  IntValue.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/8/28.
//

import Foundation

public typealias DefaultInt = DefaultBaseType<Int>

extension Int: HasDefaultValue {
    public static var defaultValue = 0
}
