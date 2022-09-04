//
//  ArrayTypeTests.swift
//  CodableDefaultValueTests
//
//  Created by liuduo on 2022/8/28.
//

import XCTest
@testable import CodableDefaultValue

struct BaseTypeArray: Codable {
    @DefaultArray var nums: [Int]
}

struct Info: Codable {
    var name: String
}

struct TestArrayModel: Codable {
    @DefaultArray var infos: [Info]
}

class ArrayTypeTests: XCTestCase {
    
    func testBaseTypeArray() throws {
        let data = """
            {
                "nums": [1, 3, 4, 5, 6]
            }
            """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(BaseTypeArray.self, from: data)
        assert(model.nums.count == 5)
        assert(model.nums[3] == 5)
    }
    
    func testNoBaseTypeArray() throws {
        let data = """
            {
            
            }
            """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(BaseTypeArray.self, from: data)
        assert(model.nums.count == 0)
    }
    
    func testArray() throws {
        let data = """
            {
                "infos": [
                    { "name": "name1" },
                    { "name": "name2" }
                ]
            }
            """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestArrayModel.self, from: data)
        assert(model.infos.count == 2)
        assert(model.infos[1].name == "name2")
    }
    
    func testNoArray() throws {
        let data = """
            {
            }
            """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestArrayModel.self, from: data)
        assert(model.infos.count == 0)
    }
}
