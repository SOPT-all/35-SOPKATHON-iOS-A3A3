//
//  RandomService.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/24/24.
//

import Foundation

import Moya

protocol RandomServiceProtocol {
    func getRandomImage(completion: @escaping (NetworkResult<RandomImageResponseDTO>) -> ())

}

final class RandomService: BaseService, RandomServiceProtocol {
    let provider = MoyaProvider<RancomAPI>.init(plugins: [MoyaPlugin()])
    
    func getRandomImage(completion: @escaping (NetworkResult<RandomImageResponseDTO>) -> ()) {
        provider.request(.getRandomImage) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<RandomImageResponseDTO> = self.fetchNetworkResult(
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
