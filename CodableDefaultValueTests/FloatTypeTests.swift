//
//  FloatTypeTests.swift
//  CodableDefaultValueTests
//
//  Created by liuduo on 2022/9/5.
//

import XCTest
import CodableDefaultValue

struct TestFloatModel: Codable {
    @DefaultFloat var f: Float
}

class FloatTypeTests: XCTestCase {
    
    func testFloat() throws {
        let data = """
            {
                "f": 2.2
            }
            """.data(using: .utf8)!
        let model = try JSONDecoder().decode(TestFloatModel.self, from: data)
        assert(model.f == 2.2)
    }
    
    func testNoFloat() throws {
        let data = """
            {
            }
            """.data(using: .utf8)!
        let model = try JSONDecoder().decode(TestFloatModel.self, from: data)
        assert(model.f == 0)
    }
}
