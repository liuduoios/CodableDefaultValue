//
//  DefaultDouble.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/9/5.
//

import Foundation

public typealias DefaultDouble = DefaultBaseType<Double>

extension Double: HasDefaultValue {
    public static var defaultValue = 0.0
}
