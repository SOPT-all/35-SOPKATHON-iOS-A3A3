//
//  FontLiterals.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/23/24.
//

import UIKit

enum FontWeight: String {
    case pretendardRegular = "Pretendard-Regular"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardBold = "Pretendard-Bold"
    case pretendardExtraBold = "Pretendard-ExtraBold"
}

enum Heading {
    case h1SemiBold
    case h2ExtraBold
    case h2SemiBold
    case h3SemiBold
    case h4Bold
    case h5SemiBold
    case h6SemiBold
}

enum Body {
    case b1SemiBold
    case b2Medium
    case b2Regular
    case b3SemiBold
    case b4SemiBold
    case b4Medium
    case b5Medium
    case b5Regular
}

extension UIFont {

    static func pretendardFont(weight: FontWeight, ofSize fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: weight.rawValue, size: fontSize) else { fatalError("Font not found") }
        return font
    }
    
    static func head(_ style: Heading) -> UIFont {
        switch style {
        case .h1SemiBold: return pretendardFont(weight: .pretendardSemiBold, ofSize: 56)
        case .h2ExtraBold: return pretendardFont(weight: .pretendardExtraBold, ofSize: 40)
        case .h2SemiBold: return pretendardFont(weight: .pretendardSemiBold, ofSize: 40)
        case .h3SemiBold: return pretendardFont(weight: .pretendardSemiBold, ofSize: 28)
        case .h4Bold: return pretendardFont(weight: .pretendardBold, ofSize: 24)
        case .h5SemiBold: return pretendardFont(weight: .pretendardSemiBold, ofSize: 20)
        case .h6SemiBold: return pretendardFont(weight: .pretendardSemiBold, ofSize: 16)
        }
    }
    
    static func body(_ style: Body) -> UIFont {
        switch style {
        case .b1SemiBold: return pretendardFont(weight: .pretendardSemiBold, ofSize: 24)
        case .b2Medium: return pretendardFont(weight: .pretendardMedium, ofSize: 20)
        case .b2Regular: return pretendardFont(weight: .pretendardRegular, ofSize: 20)
        case .b3SemiBold: return pretendardFont(weight: .pretendardSemiBold, ofSize: 18)
        case .b4SemiBold: return pretendardFont(weight: .pretendardSemiBold, ofSize: 16)
        case .b4Medium: return pretendardFont(weight: .pretendardMedium, ofSize: 16)
        case .b5Medium: return pretendardFont(weight: .pretendardMedium, ofSize: 14)
        case .b5Regular: return pretendardFont(weight: .pretendardRegular, ofSize: 14)
        }
    }
    
}
