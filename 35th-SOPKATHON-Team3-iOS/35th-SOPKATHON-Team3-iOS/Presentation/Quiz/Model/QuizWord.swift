//
//  QuizWord.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 최안용 on 11/24/24.
//


import Foundation

public struct QuizWord {
    let word: String
}

extension QuizWord {
    static func mockData() -> [QuizWord] {
        [
            .init(word: "키르기스스탄"),
            .init(word: "테스토스테론"),
            .init(word: "에스트로겐"),
            .init(word: "알파카사육사"),
            .init(word: "체코슬로바킹"),
            .init(word: "스파르타쿠스"),
            .init(word: "뿌팟퐁커리"),
            .init(word: "미역말미잘해삼"),
            .init(word: "꿀아메리카노"),
            .init(word: "오징어집땅콩")
        ]
    }
}
