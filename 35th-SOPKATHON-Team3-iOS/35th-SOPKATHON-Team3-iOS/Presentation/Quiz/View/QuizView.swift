//
//  QuizView.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 최안용 on 11/24/24.
//


import UIKit

import SnapKit
import Then

final class QuizView: UIView {
    
    // MARK: - UI Properties
    
    private let headerView = UIView()
    private let headerLabel = UILabel()
    private let titleLabel = UILabel()
    private let quizLabel = UILabel()
    private let answerView = UIView()
    private let myAnswerLabel = UILabel()
    let inputTextField = UITextField()
    lazy var progressView = UIProgressView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setStyle() {
        backgroundColor = .white
        
        headerView.do {
            $0.backgroundColor = .primary200
            $0.makeCornerRadius(cornerRadius: 17)
        }
        
        headerLabel.do {
            $0.text = "얼마나 취했는지 테스트"
            $0.font = UIFont.body(.b5Medium)
            $0.textColor = .primary500
        }
        
        titleLabel.do {
            $0.text = "제한 시간 내에 정확히 입력하세요"
            $0.font = UIFont.head(.h6SemiBold)
            $0.textColor = .gray60
        }

        quizLabel.do {
            $0.font = UIFont.head(.h2ExtraBold)
            $0.textColor = .gray60
        }
        
        answerView.do {
            $0.backgroundColor = .gray10
            $0.makeCornerRadius(cornerRadius: 10)
        }
        
        myAnswerLabel.do {
            $0.text = "내 답안"
            $0.font = UIFont.body(.b5Medium)
            $0.textColor = .gray70
        }
        
        inputTextField.do {
            $0.font = .systemFont(ofSize: 25)
            $0.autocorrectionType = .no
            $0.spellCheckingType = .no
            $0.autocapitalizationType = .none
            $0.returnKeyType = .done
            $0.becomeFirstResponder()
        }
        
        progressView.do {
            $0.trackTintColor = .primary200
            $0.progressTintColor = .primary500
            $0.progress = 0.0
        }
    }
    
    private func setUI() {
        headerView.addSubview(headerLabel)
        answerView.addSubviews(myAnswerLabel, inputTextField)
        addSubviews(
            progressView,
            headerView,
            titleLabel,
            quizLabel,
            answerView            
        )
    }
    
    private func setLayout() {
        progressView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(4)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        headerLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.verticalEdges.equalToSuperview().inset(10)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.top).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(34)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(headerView.snp.centerX)
            $0.top.equalTo(headerView.snp.bottom).offset(40)
        }
        
        quizLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.centerX.equalTo(titleLabel.snp.centerX)
        }
        
        myAnswerLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.centerX.equalToSuperview()
        }
        
        inputTextField.snp.makeConstraints {
            $0.top.equalTo(myAnswerLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        answerView.snp.makeConstraints {
            $0.top.equalTo(quizLabel.snp.bottom).offset(60)
            $0.horizontalEdges.equalToSuperview().inset(47)
            $0.height.equalTo(109)
        }
    }
}

extension QuizView {
    func quizConfiguration(word: String) {
        quizLabel.text = word
    }
}
