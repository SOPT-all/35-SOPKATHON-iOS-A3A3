//
//  SuccessViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 송여경 on 11/23/24.
//

import UIKit

import SnapKit
import Then
import Lottie

class SuccessViewController: UIViewController {
    
    private let successView = SuccessView()
    
    private let animationView1: LottieAnimationView = .init(name: "particle")
    private let animationView2: LottieAnimationView = .init(name: "Animation")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setupActions()
        configureAnimations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setStyle() {
        
    }
    
    private func setUI() {
        view.addSubviews(
            successView,
            animationView1,
            animationView2
        )
    }
    
    private func setLayout() {
        successView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        animationView1.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(230)
            $0.width.height.equalTo(360)
        }
        
        animationView2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(200)
            $0.width.height.equalTo(500)
        }
    }
    private func setupActions() {
        successView.excuseButtonAction = { [weak self] in
            self?.handleExcuseButtonTapped()
        }
        
        successView.keepGoingButtonAction = { [weak self] in
            self?.handleKeepGoingButtonTapped()
        }
    }
    
    private func handleExcuseButtonTapped() {
        let mainVC = ExcuseViewController()
        let navigationController = UINavigationController(rootViewController: mainVC)
        present(navigationController, animated: true)
    }
    
    private func handleKeepGoingButtonTapped() {
        let mainVC = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainVC)
        present(navigationController, animated: true)
    }

    private func configureAnimations() {
        animationView1.animationSpeed = 0.5
        animationView1.play()
        
        animationView2.loopMode = .repeat(2)
        animationView2.play()
    }
    
}
