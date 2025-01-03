//
//  NetworkService.swift
//  Offroad-iOS
//
//  Created by 조혜린 on 7/15/24.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()

    private init() {}
    
    let userService: UserServiceProtocol = UserService()
    let drinkService: DrinkServiceProtocol = DrinkService()
    let randomServixe: RandomServiceProtocol = RandomService()
}
