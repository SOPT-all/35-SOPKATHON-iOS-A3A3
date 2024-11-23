//
//  ExcuseViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 송여경 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class ExcuseViewController: UIViewController {
    
    private let keepGoingButton = UIButton().then {
        $0.titleLabel?.font = .head(.h6SemiBold)
        $0.setTitle("그냥 마시기", for: .normal)
        $0.setTitleColor(.primary200, for: .normal)
        $0.layer.cornerRadius = 29
        $0.backgroundColor = .primary500
    }
    
    private let anotherExcuseButton = UIButton().then {
        $0.titleLabel?.font = .head(.h6SemiBold)
        $0.setTitle("다른 핑계 보기", for: .normal)
        $0.setTitleColor(.primary500, for: .normal)
    }
    
    private let imageBackgroundView = UIView().then {
        $0.backgroundColor = .gray0
        $0.layer.cornerRadius = 10
    }
    
    private let excuseImageView = UIImageView().then {
        $0.backgroundColor = .gray30
        $0.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .primary200
    }
    
    private func setUI() {
        self.view.addSubviews(
            keepGoingButton,
            imageBackgroundView,
            excuseImageView,
            anotherExcuseButton
        )
    }
    
    private func setLayout() {
        keepGoingButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
            $0.leading.equalTo(31)
            $0.width.equalTo(314)
            $0.height.equalTo(56)
        }
        
        imageBackgroundView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(150)
            $0.width.equalTo(321)
            $0.height.equalTo(462)
        }
        
        excuseImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageBackgroundView.snp.top).offset(28.14)
            $0.width.equalTo(276.59)
            $0.height.equalTo(386.63)
        }
        
        anotherExcuseButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(112)
            $0.leading.equalToSuperview().offset(143.5)
        }
    }
    
}
//
//#Preview {
//    ExcuseViewController()
//}
