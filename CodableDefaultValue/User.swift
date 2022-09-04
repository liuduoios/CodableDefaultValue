//
//  User.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/8/28.
//

import Foundation

enum Gender: Int, HasDefaultEnumValue {
    case woman = 1
    case aaaa = 2
    static var defaultValue = Gender.aaaa
}

struct User: Codable {
    @DefaultString var nickname: String
    @DefaultInt var age: Int
    @DefaultBool var isLogin: Bool
    @DefaultIntEnum<Gender> var gender: Gender
    @DefaultDate var birth: Date
    @DefaultArray var numbers: [Int]
    @DefaultObject<UserInfo> var userInfo: UserInfo
}
