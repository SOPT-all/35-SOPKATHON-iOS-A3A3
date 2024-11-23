//
//  FailViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 송여경 on 11/23/24.
//

import UIKit

import SnapKit
import Then
import Lottie

class FailViewController: UIViewController {
    
    private let failView = FailView()
    private let animationView1: LottieAnimationView = .init(name: "fail")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setupActions()
        configureAnimations()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(
            failView,
            animationView1
        )
    }
    
    private func setLayout() {
        failView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        animationView1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(210)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(400)
        }
    }
    
    private func setupActions() {
        failView.excuseButtonAction = { [weak self] in
            self?.handleExcuseButtonTapped()
        }
        
        failView.keepGoingButtonAction = { [weak self] in
            self?.handleKeepGoingButtonTapped()
        }
    }
    
    private func handleExcuseButtonTapped() {
        print("Excuse button tapped!")
    }
    
    private func handleKeepGoingButtonTapped() {
        print("Keep Going button tapped!")
    }
    
    private func configureAnimations() {
        animationView1.contentMode = .scaleAspectFit
        animationView1.play()
        animationView1.animationSpeed = 0.5
    }
    
}
