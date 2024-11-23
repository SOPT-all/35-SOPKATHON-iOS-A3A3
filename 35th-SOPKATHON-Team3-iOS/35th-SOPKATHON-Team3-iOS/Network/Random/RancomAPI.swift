//
//  RancomAPI.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/24/24.
//

import Foundation

import Moya

enum RancomAPI {
    case getRandomImage
}

extension RancomAPI: BaseTargetType {

    var headerType: HeaderType { return .noneHeader }
    
    var parameter: [String : Any]? {
        switch self {
        case .getRandomImage:
            return nil
        }
    }
        
    var path: String {
        switch self {
        case .getRandomImage:
            return "/v1/random"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRandomImage:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getRandomImage:
            return .requestPlain
        }
    }
}


