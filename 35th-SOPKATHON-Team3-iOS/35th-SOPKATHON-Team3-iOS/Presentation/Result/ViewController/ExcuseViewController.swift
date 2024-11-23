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
    
    private let whiteBackgroundView = UIImageView().then {
        $0.image = UIImage(named: "dim")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let keepGoingButton = UIButton().then {
        $0.titleLabel?.font = .body(.b4SemiBold)
        $0.setTitle("지금까지 마신 술 다시보기", for: .normal)
        $0.setTitleColor(.gray0, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .primary500
    }
    
    private let anotherExcuseButton = UIButton().then {
        $0.titleLabel?.font = .body(.b5Medium)
        $0.setTitle("다른 핑계 보기", for: .normal)
        $0.setImage(UIImage(named: "repeat"), for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.setTitleColor(.gray0, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .gray100
        
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 8)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -8)
    }
    
    private let touchInfoLabel = UILabel().then {
        $0.text = "사진 터치해서 전체화면"
        $0.textColor = .gray20
        $0.font = .body(.b5Regular)
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
        self.view.backgroundColor = .gray0
    }
    
    private func setUI() {
        self.view.addSubviews(
            whiteBackgroundView,
            anotherExcuseButton,
            excuseImageView,
            keepGoingButton,
            touchInfoLabel
        )
    }
    
    private func setLayout() {
        whiteBackgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        keepGoingButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
            $0.leading.equalTo(31)
            $0.width.equalTo(314)
            $0.height.equalTo(56)
        }
        
        anotherExcuseButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(120)
            $0.leading.equalToSuperview().offset(119)
            $0.height.equalTo(40)
        }
        
        excuseImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(anotherExcuseButton.snp.bottom).offset(24)
            $0.width.equalTo(279)
            $0.height.equalTo(380)
        }
        touchInfoLabel.snp.makeConstraints {
            $0.top.equalTo(excuseImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
}
