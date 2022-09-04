//
//  UIntTypeTests.swift
//  HappyCodableTests
//
//  Created by 刘铎 on 2022/8/29.
//

import XCTest
import HappyCodable

struct TestUIntModel: Codable {
    @DefaultUInt var userId: UInt
}

class UIntTypeTests: XCTestCase {

    func testUInt() throws {
        let data = """
            {
                "userId": 21
            }
            """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestUIntModel.self, from: data)
        assert(model.userId == 21)
    }
    
    func testNoUInt() throws {
        let data = """
            {
                
            }
            """.data(using: .utf8)!
        let model = try JSONDecoder().decode(TestUIntModel.self, from: data)
        assert(model.userId == 0)
    }
}
