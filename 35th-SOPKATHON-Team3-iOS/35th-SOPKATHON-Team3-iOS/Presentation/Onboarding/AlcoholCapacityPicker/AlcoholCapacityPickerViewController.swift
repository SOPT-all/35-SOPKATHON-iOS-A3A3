//
//  AlcoholCapacityPickerViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/23/24.
//

import UIKit

protocol AlcoholCapacityProtocol: AnyObject {
    func changeAlcoholCapacity(text: String)
}

final class AlcoholCapacityPickerViewController: UIViewController {
    
    //MARK: - Properties
    
    weak var delegate: AlcoholCapacityProtocol?
    
    private var alcoholCapacityText = String()
    
    private let rootView = AlcoholCapacityPickerView()
    private let pickerData = ["0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5","5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10"]
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTarget()
    }
}

extension AlcoholCapacityPickerViewController {
    
    // MARK: - Private Func
    
    private func setTarget() {
        rootView.pickerView.delegate = self
        rootView.pickerView.dataSource = self
        rootView.completeButton.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - @Objc Func
    
    @objc private func completeButtonTapped() {
        delegate?.changeAlcoholCapacity(text: alcoholCapacityText)
        self.dismiss(animated: true)
    }
}

extension AlcoholCapacityPickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
}

extension AlcoholCapacityPickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 58
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: pickerData[row], attributes: [.font: UIFont.body(.b2Medium), .foregroundColor: UIColor.gray100])
        }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        alcoholCapacityText = pickerData[row]
    }
}
