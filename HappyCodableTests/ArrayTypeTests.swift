//
//  ArrayTypeTests.swift
//  HappyCodableTests
//
//  Created by liuduo on 2022/8/28.
//

import XCTest
@testable import HappyCodable

struct Info: Codable {
    var name: String
}

struct TestArrayModel: Codable {
    @DefaultArray var infos: [Info]
}

class ArrayTypeTests: XCTestCase {
    
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
