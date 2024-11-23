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
    
    private var nameText = ""
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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        deleteUserInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
}

extension OnboardingViewController {
    
    // MARK: - Private Func
    
    private func setDelegate() {
        rootView.nameTextField.delegate = self
    }
    
    private func setTarget() {
        rootView.alcoholCapacityButton.addTarget(self, action: #selector(alcoholCapacityButtonTapped), for: .touchUpInside)
        rootView.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    private func isButtonEnabled() -> Bool {
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
    
    private func postUserInfo(userInfoRequestDTO: UserInfoRequestDTO) {
        NetworkService.shared.userService.postUserInfo(body: userInfoRequestDTO) { response in
            switch response {
            case .success(let data):
                let userID = data?.userId
                UserDefaults.standard.set(userID, forKey: "userId")
                print(UserDefaults.standard.string(forKey: "userId") ?? "")
            default:
                break
            }
        }
    }
    
    private func deleteUserInfo() {
        NetworkService.shared.userService.deleteUserInfo() { response in
            switch response {
            case .success:
                self.rootView.nameTextField.text = ""
                self.rootView.alcoholCapacityButton.setTitleColor(.gray30, for: .normal)
                self.rootView.alcoholCapacityButton.setTitle("몇병", for: .normal)
            default:
                break
            }
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
        let body = UserInfoRequestDTO(name: nameText, drinkLimit: Double(alcoholCapacityText) ?? 0)
        postUserInfo(userInfoRequestDTO: body)
        
        let mainViewController = MainViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }

}

extension OnboardingViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        nameText = textField.text ?? ""
        changeStartButtonState(isEnabled: isButtonEnabled())
    }
}

extension OnboardingViewController: AlcoholCapacityProtocol {
    func changeAlcoholCapacity(text: String) {
        alcoholCapacityText = text
    }
}
