//
//  SuccessView.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 송여경 on 11/23/24.
//

import UIKit

import SnapKit
import Then

final class SuccessView: UIView {
    
    private let excuseButton = UIButton().then {
        $0.titleLabel?.font = .head(.h3SemiBold)
        $0.setTitle("귀가 핑계대기", for: .normal)
        $0.setTitleColor(.primary500, for: .normal)
        $0.layer.cornerRadius = 29
        $0.backgroundColor = .primary200
    }
    
    private let keepGoingButton = UIButton().then {
        $0.titleLabel?.font = .head(.h3SemiBold)
        $0.setTitle("그냥 마시기", for: .normal)
        $0.setTitleColor(.gray100, for: .normal)
        $0.layer.cornerRadius = 29
        $0.layer.borderColor = UIColor.gray100.cgColor
        $0.layer.borderWidth = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .white
    }
    
    private func setUI() {
        self.addSubviews(
            excuseButton,
            keepGoingButton
        )
    }
    
    private func setLayout() {
        excuseButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(111)
            $0.height.equalTo(58)
            $0.width.equalTo(314)
        }
        
        keepGoingButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(45)
            $0.height.equalTo(58)
            $0.width.equalTo(314)
        }
    }
    
}

//#Preview
//{
//    let view = SuccessView()
//    view
//}
