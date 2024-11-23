//
//  TotalDrinkResponseDTO.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/24/24.
//

import Foundation

struct DrinkResponseDTO: Codable {
    let userId: Int
    let drinkCnt: Int
    let isExceed: Bool
    let limitDrinkCnt: Int
}
