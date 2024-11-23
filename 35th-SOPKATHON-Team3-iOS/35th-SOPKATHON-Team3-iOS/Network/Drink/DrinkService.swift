//
//  DrinkService.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/24/24.
//

import Foundation

import Moya

protocol DrinkServiceProtocol {
    func getTotalDrinkInfo(completion: @escaping (NetworkResult<DrinkResponseDTO>) -> ())
    func petchDrinkInfo(completion: @escaping (NetworkResult<DrinkResponseDTO>) -> ())

}

final class DrinkService: BaseService, DrinkServiceProtocol {
    let provider = MoyaProvider<DrinkAPI>.init(plugins: [MoyaPlugin()])
    
    func getTotalDrinkInfo(completion: @escaping (NetworkResult<DrinkResponseDTO>) -> ()) {
        provider.request(.getTotalDrinkInfo) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<DrinkResponseDTO> = self.fetchNetworkResult(
                    statusCode: response.statusCode,
                    data: response.data
                )
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func petchDrinkInfo(completion: @escaping (NetworkResult<DrinkResponseDTO>) -> ()) {
        provider.request(.petchDrinkInfo) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<DrinkResponseDTO> = self.fetchNetworkResult(
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
