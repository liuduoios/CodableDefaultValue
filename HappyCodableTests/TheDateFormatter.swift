//
//  TheDateFormatter.swift
//  HappyCodableTests
//
//  Created by liuduo on 2022/8/29.
//

import Foundation

class TheDateFormatter: DateFormatter {
    static let shared: TheDateFormatter = {
        let formatter = TheDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
