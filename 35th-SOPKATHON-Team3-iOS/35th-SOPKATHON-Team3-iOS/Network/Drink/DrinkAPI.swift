//
//  DrinkAPI.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/24/24.
//

import Foundation

import Moya

enum DrinkAPI {
    case getTotalDrinkInfo
    case petchDrinkInfo
}

extension DrinkAPI: BaseTargetType {

    var headerType: HeaderType { return .userIDHeader }
    
    var parameter: [String : Any]? {
        switch self {
        case .getTotalDrinkInfo, .petchDrinkInfo:
            return nil
        }
    }
        
    var path: String {
        switch self {
        case .getTotalDrinkInfo, .petchDrinkInfo:
            return "/v1/user/drink"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTotalDrinkInfo:
            return .get
        case .petchDrinkInfo:
            return .patch
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getTotalDrinkInfo, .petchDrinkInfo:
            return .requestPlain
        }
    }
}


