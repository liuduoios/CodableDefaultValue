//
//  StringValue.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/8/28.
//

import Foundation

public typealias DefaultString = DefaultBaseType<String>

extension String: HasDefaultValue {
    public static var defaultValue = ""
}
