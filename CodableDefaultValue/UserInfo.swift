//
//  UserInfo.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/8/28.
//

import Foundation

struct UserInfo: Codable, EmptyInitializable {
    @DefaultString var parentname: String
    
    init() {
        parentname = ""
    }
}
