//
//  UserAPI.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/24/24.
//

import Foundation

import Moya

enum UserAPI {
    case postUserInfo(body: UserInfoRequestDTO)
    case deleteUserInfo
}

extension UserAPI: BaseTargetType {

    var headerType: HeaderType { return .userIDHeader }
    
    var parameter: [String : Any]? {
        switch self {
        case .postUserInfo, .deleteUserInfo:
            return nil
        }
    }
        
    var path: String {
        switch self {
        case .postUserInfo, .deleteUserInfo:
            return "/v1/user"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postUserInfo:
            return .post
        case .deleteUserInfo:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postUserInfo(let userInfoRequestDTO):
            return .requestJSONEncodable(userInfoRequestDTO)
        case .deleteUserInfo:
            return .requestPlain
        }
    }
}


