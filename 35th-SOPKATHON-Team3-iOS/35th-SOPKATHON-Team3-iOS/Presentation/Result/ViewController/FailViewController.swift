//
//  FailViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 송여경 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class FailViewController: UIViewController {
    
    private let failView = FailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setupActions()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubview(failView)
    }
    
    private func setLayout() {
        failView.snp.makeConstraints {
            $0.edges.equalToSuperview()
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
}
