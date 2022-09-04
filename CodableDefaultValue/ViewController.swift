//
//  ViewController.swift
//  CodableDefaultValue
//
//  Created by liuduo on 2022/8/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
//            let data = """
//            {
//                "nickname": "xiaobai",
//                "age": 21,
//                "gender": 1,
//                "birth": "2022-09-28T12:41:04+0800",
//                "info": {
//                    "parentname": "parentname11111"
//                }
//            }
//            """.data(using: .utf8)!
//            let decoder = JSONDecoder()
//            decoder.dateDecodingStrategy = .iso8601
//            let user = try decoder.decode(User.self, from: data)
//            print("user nickname = \(user.nickname)")
//            print("user age = \(user.age)")
            
            let data2 = """
            {
                "nickname": "xiaobaidddd",
                "age": 21,
                "numbers": [1,2,3],
                "userInfo": {}
            }
            """.data(using: .utf8)!
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let user2 = try decoder.decode(User.self, from: data2)
            print("user2 nickname = \(user2.nickname)")
            print("user2 age = \(user2.age)")
            print("user2 isLogin = \(user2.isLogin)")
            print("user2 gender = \(user2.gender)")
            print("user2 date = \(user2.birth)")
            print("user2 array = \(user2.numbers)")
            print("user2 userInfo = \(user2.userInfo)")
            
            
        } catch {
            print(error)
        }
    }


}

