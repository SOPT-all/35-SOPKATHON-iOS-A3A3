//
//  OnboardingView.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/23/24.
//

import UIKit

import SnapKit
import Then

final class OnboardingView: UIView {

    //MARK: - UI Properties
    
    private let titleLabel = UILabel()
    private let nameTextField = UITextField()
    let alcoholCapacityButton = UIButton()
    private let verticalStackView = UIStackView()
    let startButton = UIButton()
        
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingView {
    
    // MARK: - Layout
    
    private func setStyle() {
        backgroundColor = .white
        
        titleLabel.do {
            $0.text = "오늘 몇 병 마실거야?"
            $0.textColor = .gray100
            $0.font = .head(.h4Bold)
        }
        
        nameTextField.do {
            $0.setPlaceholder(placeholder: "이름", fontColor: .gray30, font: .body(.b4Medium))
            $0.setTextFont(font: .body(.b4Medium), fontColor: .gray70)
            $0.textAlignment = .center
            $0.backgroundColor = .gray10
            $0.makeCornerRadius(cornerRadius: 10)
        }
        
        alcoholCapacityButton.do {
            $0.setTitle("몇병", for: .normal)
            $0.setTitleColor(.gray30, for: .normal)
            $0.titleLabel?.font = .body(.b4Medium)
            $0.backgroundColor = .gray10
            $0.makeCornerRadius(cornerRadius: 10)
        }
        
        verticalStackView.do {
            $0.axis = .vertical
            $0.spacing = 6
            $0.distribution = .fillEqually
        }
        
        startButton.do {
            $0.setTitle("술 마시러 가기", for: .normal)
            $0.titleLabel?.font = .body(.b4SemiBold)
            $0.backgroundColor = .primary500
            $0.makeCornerRadius(cornerRadius: 10)
        }
    }
    
    private func setHierarchy() {
        addSubviews(titleLabel, verticalStackView, startButton)
        verticalStackView.addArrangedSubviews(nameTextField, alcoholCapacityButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(240)
            $0.centerX.equalToSuperview()
        }
        
        verticalStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(60)
            $0.horizontalEdges.equalToSuperview().inset(60)
            $0.height.equalTo(120)
        }
        
        startButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
    }
}
