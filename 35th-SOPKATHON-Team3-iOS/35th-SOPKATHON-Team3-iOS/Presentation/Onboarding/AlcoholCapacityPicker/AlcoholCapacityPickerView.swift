//
//  AlcoholCapacityPickerView.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/23/24.
//

import UIKit

import SnapKit
import Then

final class AlcoholCapacityPickerView: UIView {
    
    //MARK: - UI Properties
    
    private let titleLabel = UILabel()
    let pickerView = UIPickerView()
    let completeButton = UIButton()
    
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

extension AlcoholCapacityPickerView {
    
    // MARK: - Layout
    
    private func setStyle() {
        backgroundColor = .white
        makeCornerRadius(cornerRadius: 10, maskedCorners: [.layerMinXMaxYCorner,.layerMaxXMaxYCorner])
        
        titleLabel.do {
            $0.text = "주량 선택"
            $0.textColor = .gray100
            $0.font = .head(.h6SemiBold)
        }
        
        completeButton.do {
            $0.setTitle("완료", for: .normal)
            $0.titleLabel?.font = .body(.b4SemiBold)
            $0.backgroundColor = .primary500
            $0.makeCornerRadius(cornerRadius: 10)
        }
    }
    
    private func setHierarchy() {
        addSubviews(titleLabel, pickerView, completeButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        pickerView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.bottom.equalTo(completeButton.snp.top)
            $0.horizontalEdges.equalToSuperview()
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
    }
}
