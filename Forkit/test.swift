//
//  API.swift
//  EasyAppointment
//
//  Created by 笨蛋 on 3/27/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Moya
enum testRequest{
    case test()
    
    
}

extension testRequest: TargetType {
    
    
    var baseURL: URL { return URL(string:"http://joinwebdesign.com/forkit/")! }
    var path: String {
        switch self {
        case  let .test():
            return "display_restaurant.php"
        }
    }
    var method: Moya.Method {
        switch self {
        case .test():
            return .get
        }
    }
    var task: Task {
        switch self {
        case .test():
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .test():
            return "".utf8Encoded
        }
        
    }
    
    var headers: [String: String]? {
        //        print(UserDefaults.standard.string(forKey: "token")!)
        return [:]
//        return ["Content-type": "application/json",
//                "User-Agent":"\(UIDevice.current.systemName) \(UIDevice.current.model)",
////            "Authorization":"\(UserDefaults.standard.string(forKey: "token")!)",
//            "Accept":"application/json"
//        ]
    }
    
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

