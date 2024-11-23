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
    
    var excuseButtonAction: (() -> Void)?
    var keepGoingButtonAction: (() -> Void)?
    
    private lazy var excuseButton = UIButton().then {
        $0.titleLabel?.font = .body(.b4SemiBold)
        $0.setTitle("집 갈 핑계 만들기", for: .normal)
        $0.setTitleColor(.primary500, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .primary200
    }
    
    private lazy var keepGoingButton = UIButton().then {
        $0.titleLabel?.font = .body(.b4SemiBold)
        $0.setTitle("그래도 마셔볼래...", for: .normal)
        $0.setTitleColor(.gray70, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .gray10
    }
    
    private let successLabel = UILabel().then {
        $0.text = "성공했지만 주량 초과..."
        $0.textColor = .gray100
        $0.font = .head(.h4Bold)
    }
    
    private let successSubLabel = UILabel().then {
        $0.text = "오늘은 여기까지가 좋을 것 같아요!"
        $0.textColor = .gray100
        $0.font = .head(.h4Bold)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
        setupActions()
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
            keepGoingButton,
            successLabel,
            successSubLabel
        )
    }
    
    private func setLayout() {
        excuseButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(111)
            $0.height.equalTo(56)
            $0.width.equalTo(335)
        }
        
        keepGoingButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(45)
            $0.height.equalTo(56)
            $0.width.equalTo(335)
        }
        
        successLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(120)
        }
        
        successSubLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(successLabel.snp.bottom).offset(12)
        }
        
    }
    
    private func setupActions() {
        excuseButton.addTarget(self, action: #selector(didTapExcuseButton), for: .touchUpInside)
        keepGoingButton.addTarget(self, action: #selector(didTapKeepGoingButton), for: .touchUpInside)
    }
    
    @objc private func didTapExcuseButton() {
        excuseButtonAction?()
    }
    
    @objc private func didTapKeepGoingButton() {
        keepGoingButtonAction?()
    }
    
}
