//
//  EnumTypeTests.swift
//  CodableDefaultValueTests
//
//  Created by liuduo on 2022/8/29.
//

import XCTest
import CodableDefaultValue

enum Gender: Int, HasDefaultEnumValue {
    case man = 1
    case woman = 2
    static var defaultValue = Gender.man
}

struct TestEnumModel: Codable {
    @DefaultIntEnum<Gender> var gender: Gender
}

class EnumTypeTests: XCTestCase {
    
    func testEnum() throws {
        let data = """
            {
                "gender": 2
            }
            """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestEnumModel.self, from: data)
        assert(model.gender == .woman)
    }
    
    func testNoEnum() throws {
        let data = """
            {
            
            }
            """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestEnumModel.self, from: data)
        assert(model.gender == .man)
    }
}
