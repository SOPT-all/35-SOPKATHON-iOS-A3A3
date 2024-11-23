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
    
    private var alcoholCapacityText = "" {
        didSet {
            rootView.alcoholCapacityButton.setTitle(alcoholCapacityText, for: .normal)
            rootView.alcoholCapacityButton.setTitleColor(.gray70, for: .normal)
            changeStartButtonState(isEnabled: isButtonEnabled())
        }
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setTarget()
        hideKeyboard()
    }
}

extension OnboardingViewController {
    
    // MARK: - Private Func
    
    private func setDelegate() {
        rootView.nameTextField.delegate = self
    }
    
    private func setTarget() {
        rootView.alcoholCapacityButton.addTarget(self, action: #selector(alcoholCapacityButtonTapped), for: .touchUpInside)
    }
    
    private func isButtonEnabled() -> Bool {
        let nameText = rootView.nameTextField.text ?? ""
        return nameText != "" && alcoholCapacityText != "" && alcoholCapacityText != "몇병"
    }
    
    private func changeStartButtonState(isEnabled: Bool) {
        if isEnabled {
            rootView.startButton.setTitleColor(.gray0, for: .normal)
            rootView.startButton.backgroundColor = .primary500
            rootView.startButton.isEnabled = true
        } else {
            rootView.startButton.setTitleColor(.gray40, for: .normal)
            rootView.startButton.backgroundColor = .gray20
            rootView.startButton.isEnabled = false
        }
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

extension OnboardingViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        changeStartButtonState(isEnabled: isButtonEnabled())
    }
}

extension OnboardingViewController: AlcoholCapacityProtocol {
    func changeAlcoholCapacity(text: String) {
        alcoholCapacityText = text
    }
}
