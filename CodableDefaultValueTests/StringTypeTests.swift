//
//  StringTypeTests.swift
//  CodableDefaultValueTests
//
//  Created by liuduo on 2022/8/29.
//

import XCTest
import CodableDefaultValue

struct TestStringModel: Codable {
    @DefaultString var name: String
}

class StringTypeTests: XCTestCase {
    
    func testString() throws {
        let data = """
            {
                "name": "Tom",
                "age": 21
            }
            """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestStringModel.self, from: data)
        assert(model.name == "Tom")
    }
    
    func testNoString() throws {
        let data = """
            {
                "age": 21
            }
            """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestStringModel.self, from: data)
        assert(model.name == "")
    }
}
