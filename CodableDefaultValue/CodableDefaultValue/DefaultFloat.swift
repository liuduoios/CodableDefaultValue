//
//  DefaultFloat.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/9/5.
//

import Foundation

public typealias DefaultFloat = DefaultBaseType<Float>

extension Float: HasDefaultValue {
    public static var defaultValue: Float = 0.0
}
