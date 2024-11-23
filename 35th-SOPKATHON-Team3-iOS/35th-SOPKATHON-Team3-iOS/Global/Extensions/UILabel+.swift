//
//  UILabel+.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/22/24.
//

import UIKit

extension UILabel {
    
    /// 특정 text의 속성(폰트, 색상)을 바꿔주는 함수
    /// - Parameter targetText: 변경할 String 값
    /// - Parameter font: 적용할 font
    /// - Parameter color: 적용할 color
    /// > 사용 예시 : `label.highlightText(targetText: nicknameString, font: .offroad(style: .iosSubtitle2Bold))`
    func highlightText(targetText: String, font: UIFont? = nil, color: UIColor? = nil) {
        guard let labelText = self.text else { return }
        guard let attributedText else { return }
        
        let attributedString = NSMutableAttributedString(attributedString: attributedText)
        let range = (labelText as NSString).range(of: targetText)
        
        if let font {
            attributedString.addAttribute(.font, value: font, range: range)
        }
        
        if let color {
            attributedString.addAttribute(.foregroundColor, value: color, range: range)
        }
        
        self.attributedText = attributedString
    }
    
    /// 특정 text에 underline을 추가하는 함수
    /// > 사용 예시 : label.underLineText(forText: "맛집을 추천")
    func underLineText(forText: String) {
        guard let labelText = self.text else { return }
        
        let rangeToUnderLine = (labelText as NSString).range(of: forText)
        
        let underLineText = NSMutableAttributedString(string: labelText)
        underLineText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderLine)
        
        self.attributedText = underLineText
    }
    
}
