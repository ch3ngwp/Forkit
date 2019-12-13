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
enum StoreRequest{
    case FetchStoreById(storeId:String)
    case FetchAllStore()
    
}

extension StoreRequest: TargetType {
    
    
    var baseURL: URL { return URL(string:"http://joinwebdesign.com/forkit/")! }
    var path: String {
        switch self {
        case  .FetchStoreById(_):
            return "restaurant_detail.php"
        case  .FetchAllStore():
            return "display_restaurant.php"
        }
    }
    var method: Moya.Method {
        switch self {
        case .FetchStoreById(_),.FetchAllStore():
            return .post
        }
    }
    var task: Task {
        switch self {
        case let .FetchStoreById(storeId):
            return .requestParameters(parameters: ["store_id":storeId], encoding: URLEncoding.queryString  )
        case .FetchAllStore():
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .FetchStoreById(_),.FetchAllStore():
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

