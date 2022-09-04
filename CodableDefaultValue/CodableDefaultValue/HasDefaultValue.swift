//
//  DefaultValue.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/8/28.
//

import Foundation

public protocol HasDefaultValue {
    static var defaultValue: Self { get set }
}
