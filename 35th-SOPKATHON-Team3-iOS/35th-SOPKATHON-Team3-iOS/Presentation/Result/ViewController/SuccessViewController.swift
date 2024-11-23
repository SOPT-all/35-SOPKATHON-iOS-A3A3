//
//  SuccessViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 송여경 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class SuccessViewController: UIViewController {
    
    private let successView = SuccessView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setupActions()
    }
    
    private func setStyle() {
        
    }
    
    private func setUI() {
        view.addSubview(successView)
    }
    
    private func setLayout() {
        successView.snp.makeConstraints {
            $0.edges.equalToSuperview()
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
        print("Excuse button tapped!")
    }
    
    private func handleKeepGoingButtonTapped() {
        print("Keep Going button tapped!")
    }
    
}
