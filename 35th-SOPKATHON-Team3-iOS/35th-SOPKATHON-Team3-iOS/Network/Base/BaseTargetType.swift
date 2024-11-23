//
//  BaseTargetType.swift
//  Offroad-iOS
//
//  Created by 조혜린 on 7/15/24.
//

import Foundation

import Moya

enum HeaderType {
    case noneHeader
    case userIDHeader
}

protocol BaseTargetType: TargetType {
    var headerType: HeaderType { get }
}

extension BaseTargetType {
    
    var baseURL: URL {
        guard let urlString = Bundle.main.infoDictionary?["BASE_URL"] as? String,
              let url = URL(string: urlString) else {
            fatalError("🚨Base URL을 찾을 수 없습니다🚨")
        }
        return url
    }
        
    var headers: [String: String]? {
        
        switch headerType {
        case .noneHeader:
            return .none
        case .userIDHeader:
            let userID = UserDefaults.standard.string(forKey: "userId") ?? ""
            let header = ["userId": userID]
            return header
        }
    }
}
