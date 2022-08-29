//
//  TheDecoder.swift
//  HappyCodableTests
//
//  Created by liuduo on 2022/8/29.
//

import Foundation

class TheDecoder: JSONDecoder {
    static let shared = TheDecoder()
    
    override init() {
        super.init()
        dateDecodingStrategy = .custom({ decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.date(from: dateString) ?? Date()
        })
    }
}
