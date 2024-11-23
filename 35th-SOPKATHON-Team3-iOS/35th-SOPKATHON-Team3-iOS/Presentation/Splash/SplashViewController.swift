//
//  SplashViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/23/24.
//

import UIKit

import SnapKit
import Then

final class SplashViewController: UIViewController {
    private let logoImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLaout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        moveToOnboarding()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        logoImageView.do {
            $0.image = .logo
        }
    }
    
    private func setUI() {
        view.addSubview(logoImageView)
    }
    
    private func setLaout() {
        logoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func moveToOnboarding() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            let onboardingViewController = OnboardingViewController()
            self.navigationController?.pushViewController(onboardingViewController, animated: true)
        }
    }
}
