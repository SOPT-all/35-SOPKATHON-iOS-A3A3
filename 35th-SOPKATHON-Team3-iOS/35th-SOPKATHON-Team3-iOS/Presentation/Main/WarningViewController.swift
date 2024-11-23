//
//  WarningViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 김유림 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class WarningViewController: UIViewController {
    
    // MARK: - Properties
    
    private let warningView = UIView().then {
        $0.backgroundColor = .gray0
        $0.layer.cornerRadius = 10
    }
    
    private let contentLabel = UILabel().then {
        $0.text = "벌써 주량을 넘어버렸어요!"
        $0.font = .head(.h5SemiBold)
        $0.textColor = .gray100
    }
    
    private let imageView = UIImageView().then {
        $0.backgroundColor = .primary200
        $0.contentMode = .scaleAspectFit
    }
    
    private let buttonStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
    }
    
    private let testButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        let attributes: [NSAttributedString.Key: Any] = [.font : UIFont.pretendardFont(weight: .pretendardSemiBold, ofSize: 18)]
        let attributedTitle = AttributedString(NSAttributedString(string: "취했는지 확인해 볼까?", attributes: attributes))
        
        config.attributedTitle = attributedTitle
        config.baseBackgroundColor = .primary200
        config.background.cornerRadius = 29
        config.baseForegroundColor = .primary500
        $0.configuration = config
    }
    
    private let drinkButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        let attributes: [NSAttributedString.Key: Any] = [.font : UIFont.pretendardFont(weight: .pretendardSemiBold, ofSize: 18)]
        let attributedTitle = AttributedString(NSAttributedString(string: "그래도 마셔볼래...", attributes: attributes))
        
        config.attributedTitle = attributedTitle
        config.baseBackgroundColor = .gray10
        config.background.cornerRadius = 29
        config.baseForegroundColor = .gray70
        $0.configuration = config
    }
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setHierarchy()
        setConstraints()
        setAddTarget()
    }
    
    private func setUI() {
        view.backgroundColor = .gray100.withAlphaComponent(0.7)
    }
    
    private func setHierarchy() {
        view.addSubview(warningView)
        
        warningView.addSubviews(
            contentLabel,
            imageView,
            buttonStackView)
        
        buttonStackView.addArrangedSubviews(
            testButton,
            drinkButton
        )
    }
    
    private func setConstraints() {
        warningView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(120)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        [testButton, drinkButton].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(56)
            }
        }
    }
    
    private func setAddTarget() {
        testButton.addTarget(self, action: #selector(tappedTestButton), for: .touchUpInside)
        
        drinkButton.addTarget(self, action: #selector(tappedDrinkButton), for: .touchUpInside)
    }
    
    @objc func tappedTestButton() {
        // TODO: test 페이지 present
    }
    
    @objc func tappedDrinkButton() {
        self.dismiss(animated: true)
    }
}
