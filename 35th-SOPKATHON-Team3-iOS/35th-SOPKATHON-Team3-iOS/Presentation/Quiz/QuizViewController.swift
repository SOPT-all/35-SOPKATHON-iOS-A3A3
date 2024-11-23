//
//  QuizViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/23/24.
//

import UIKit

final class QuizViewController: UIViewController {
    private let rootView = QuizView()
    
    private let quizeWords = QuizWord.mockData()
    private var currentWord: QuizWord?
    private var time: Float = 0.0
    private var timer: Timer?
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.inputTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        guard let currentWord =  quizeWords.randomElement() else { return }
        self.currentWord = currentWord
        rootView.quizConfiguration(word: currentWord.word)
        timer?.invalidate()
        time = 0.0
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(setProgress),
            userInfo: nil,
            repeats: true
        )
        rootView.inputTextField.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension QuizViewController {
    private func checkAnswer() {
        guard let currentWord else { return }
        if rootView.inputTextField.text == currentWord.word {
            navigationController?.pushViewController(SuccessViewController(), animated: true)
        } else {
            navigationController?.pushViewController(FailViewController(), animated: true)
        }
    }
    
    @objc
    private func setProgress() {
        time += 0.01
        rootView.progressView.setProgress(time / 8, animated: true)
        if time >= 8.0 {
            timer?.invalidate()
            checkAnswer()
            rootView.progressView.progress = 0.0
        }
    }
}

extension QuizViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        timer?.invalidate()
        rootView.progressView.progress = 0.0
        checkAnswer()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.isEmpty == false {
            rootView.answerView.makeBorder(width: 1, color: .primary500)
        } else {
            rootView.answerView.makeBorder(width: 0, color: .clear)
        }
    }
}
