//
//  ObjectTypeTests.swift
//  CodableDefaultValueTests
//
//  Created by liuduo on 2022/8/28.
//

import XCTest
@testable import CodableDefaultValue

struct ObjectInfo: Codable, EmptyInitializable {
    @DefaultString var name: String
    @DefaultInt var age: Int
    
    init() {
        name = ""
        age = 0
    }
}

struct TestObjectModel: Codable {
    @DefaultObject var info: ObjectInfo
}

class ObjectTypeTests: XCTestCase {
    
    func testObject() throws {
        let data = """
                {
                    "info": {
                        "name": "zhangsan",
                        "age": 111
                    }
                }
                """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestObjectModel.self, from: data)
        assert(model.info.name == "zhangsan")
        assert(model.info.age == 111)
    }
    
    func testNoObject() throws {
        let data = """
                {
                }
                """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestObjectModel.self, from: data)
        assert(model.info.name == "")
        assert(model.info.age == 0)
    }
}
