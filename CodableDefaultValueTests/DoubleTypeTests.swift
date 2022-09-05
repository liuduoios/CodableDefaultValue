//
//  DoubleTypeTests.swift
//  CodableDefaultValueTests
//
//  Created by liuduo on 2022/9/5.
//

import XCTest
import CodableDefaultValue

struct TestDoubleModel: Codable {
    @DefaultDouble var d: Double
}

class DoubleTypeTests: XCTestCase {
    
    func testDouble() throws {
        let data = """
            {
                "d": 2.2
            }
            """.data(using: .utf8)!
        let model = try JSONDecoder().decode(TestDoubleModel.self, from: data)
        assert(model.d == 2.2)
    }
    
    func testNoDouble() throws {
        let data = """
            {
            }
            """.data(using: .utf8)!
        let model = try JSONDecoder().decode(TestDoubleModel.self, from: data)
        assert(model.d == 0)
    }
}
