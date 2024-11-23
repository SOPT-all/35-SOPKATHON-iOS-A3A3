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
            .init(word: "허니솔티드카라멜"),
            .init(word: "테스토스테론"),
            .init(word: "에스트로겐"),
            .init(word: "땅콩초코크림빵"),
            .init(word: "알파카사육사"),
            .init(word: "체코슬로바킹"),
            .init(word: "카라멜프라푸치노"),
            .init(word: "스파르타쿠스"),
            .init(word: "뿌팟퐁커리")
        ]
    }
}
