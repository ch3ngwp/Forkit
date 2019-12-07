//
//  LoginRequest.swift
//  Forkit
//
//  Created by 笨蛋 on 12/4/19.
//  Copyright © 2019 Forkit Inc. All rights reserved.
//

//
//  API.swift
//  EasyAppointment
//
//  Created by 笨蛋 on 3/27/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Moya
enum LoginRequest{
    case UserLogin(account:String,password:String)
    
}

extension LoginRequest: TargetType {
    
    
    var baseURL: URL { return URL(string:"http://joinwebdesign.com/forkit/")! }
    var path: String {
        switch self {
        case  let .UserLogin(_,_):
            return "user_login.php"
        }
    }
    var method: Moya.Method {
        switch self {
        case .UserLogin(_,_):
            return .post
        }
    }
    var task: Task {
        switch self {
        case let .UserLogin(account,password):
            return .requestParameters(parameters: ["username":account,"pass":password], encoding: URLEncoding.queryString  )
        }
    }
    var sampleData: Data {
        switch self {
        case .UserLogin(_,_):
            return "".utf8Encoded
        }
        
    }
    
    var headers: [String: String]? {
                return ["Content-type": "application/json",
                        "User-Agent":"\(UIDevice.current.systemName) \(UIDevice.current.model)",
                    "Accept":"application/json"
                ]
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

