//
//  IntTypeTests.swift
//  HappyCodableTests
//
//  Created by liuduo on 2022/8/29.
//

import XCTest
import HappyCodable

struct TestIntModel: Codable {
    @DefaultInt var age: Int
}

class IntTypeTests: XCTestCase {

    func testInt() throws {
        let data = """
            {
                "age": 21
            }
            """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestIntModel.self, from: data)
        assert(model.age == 21)
    }
    
    func testNoInt() throws {
        let data = """
            {
                "name": "Tom"
            }
            """.data(using: .utf8)!
        let model = try JSONDecoder().decode(TestIntModel.self, from: data)
        assert(model.age == 0)
    }
}
