//
//  DefaultUInt.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/8/29.
//

import Foundation

public typealias DefaultUInt = DefaultBaseType<UInt>

extension UInt: HasDefaultValue {
    public static var defaultValue: UInt = 0
}
