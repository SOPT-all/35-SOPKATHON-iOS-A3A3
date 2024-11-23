//
//  UserService.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/24/24.
//

import Foundation

import Moya

protocol UserServiceProtocol {
    func postUserInfo(body: UserInfoRequestDTO, completion: @escaping (NetworkResult<UserInfoResponseDTO>) -> ())
}

final class UserService: BaseService, UserServiceProtocol {
    let provider = MoyaProvider<UserAPI>.init(plugins: [MoyaPlugin()])
    
    func postUserInfo(body: UserInfoRequestDTO, completion: @escaping (NetworkResult<UserInfoResponseDTO>) -> ()) {
        provider.request(.postUserInfo(body: body)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<UserInfoResponseDTO> = self.fetchNetworkResult(
                    statusCode: response.statusCode,
                    data: response.data
                )
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
}
