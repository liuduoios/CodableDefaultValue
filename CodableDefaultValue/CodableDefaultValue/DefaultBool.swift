//
//  DefaultBool.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/8/29.
//

import Foundation

public typealias DefaultBool = DefaultBaseType<Bool>

extension Bool: HasDefaultValue {
    public static var defaultValue = false
}
