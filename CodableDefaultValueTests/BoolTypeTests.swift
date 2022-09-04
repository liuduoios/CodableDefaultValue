//
//  BoolTypeTests.swift
//  CodableDefaultValueTests
//
//  Created by liuduo on 2022/8/29.
//

import XCTest
import CodableDefaultValue

struct TestBoolModel: Codable {
    @DefaultBool var logined: Bool
}

class BoolTypeTests: XCTestCase {
    
    func testBool() throws {
        let data = """
            {
                "logined": true
            }
            """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestBoolModel.self, from: data)
        assert(model.logined)
    }

    func testNoBool() throws {
        let data = """
            {
            
            }
            """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestBoolModel.self, from: data)
        assert(!model.logined)
    }
}
