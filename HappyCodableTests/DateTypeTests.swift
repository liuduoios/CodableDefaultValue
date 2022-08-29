//
//  DateTypeTests.swift
//  HappyCodableTests
//
//  Created by liuduo on 2022/8/28.
//

import XCTest
@testable import HappyCodable

struct TestDateModel: Codable {
    @DefaultDate var birth: Date
}

class DateTypeTests: XCTestCase {

    func testDate() throws {
        let data = """
                {
                    "name": "Tom",
                    "age": 21,
                    "birth": "2011-01-25"
                }
                """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestDateModel.self, from: data)
        assert(model.birth == TheDateFormatter.shared.date(from: "2011-01-25"))
    }
    
    func testNoDate() throws {
        let data = """
                {
                    "name": "Tom",
                    "age": 21
                }
                """.data(using: .utf8)!
        let model = try TheDecoder.shared.decode(TestDateModel.self, from: data)
        assert(model.birth == Date(timeIntervalSinceReferenceDate: 0))
    }
}
