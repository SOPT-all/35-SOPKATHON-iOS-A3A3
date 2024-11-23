//
//  OnboardingViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/23/24.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    //MARK: - Properties
    
    private let rootView = OnboardingView()
    
    private var alcoholCapacityText = String() {
        didSet {
            rootView.alcoholCapacityButton.setTitle(alcoholCapacityText, for: .normal)
            rootView.alcoholCapacityButton.setTitleColor(.gray70, for: .normal)
        }
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTarget()
        hideKeyboard()
    }
}

extension OnboardingViewController {
    
    // MARK: - Private Func
    
    private func setTarget() {
        rootView.alcoholCapacityButton.addTarget(self, action: #selector(alcoholCapacityButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - @Objc Func
    
    @objc private func alcoholCapacityButtonTapped() {
        let alcoholCapacityPickerViewController = AlcoholCapacityPickerViewController()
        alcoholCapacityPickerViewController.delegate = self
        if let sheet = alcoholCapacityPickerViewController.sheetPresentationController {
            if #available(iOS 16.0, *) {
                sheet.detents = [.custom { _ in 318 }]
            } else {
                sheet.detents = [.medium()]
            }
        }
        
        self.present(alcoholCapacityPickerViewController, animated: true)
    }
    
    @objc private func startButtonTapped() {
        let alcoholCapacityPickerViewController = AlcoholCapacityPickerViewController()
        alcoholCapacityPickerViewController.delegate = self
        if let sheet = alcoholCapacityPickerViewController.sheetPresentationController {
            if #available(iOS 16.0, *) {
                sheet.detents = [.custom { _ in 318 }]
            } else {
                sheet.detents = [.medium()]
            }
        }
        
        self.present(alcoholCapacityPickerViewController, animated: true)
    }

}

extension OnboardingViewController: AlcoholCapacityProtocol {
    func changeAlcoholCapacity(text: String) {
        alcoholCapacityText = text
    }
}
