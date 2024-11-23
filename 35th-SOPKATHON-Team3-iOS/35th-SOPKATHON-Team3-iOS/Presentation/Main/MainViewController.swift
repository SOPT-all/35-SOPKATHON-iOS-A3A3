//
//  MainViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    var addedBottles: Int = 0
    var drinkCups: Int = 0 {
        didSet {
            drinkCupsLabel.text = String(drinkCups)
        }
    }
    var capacityCups: Int = 8
    
    var isOverDrinking: Bool = false {
        didSet {
            print("isoverdrinking set")
            
        }
        
    }
    
    private let guideLabel = UILabel().then {
        $0.font = .head(.h4Bold)
        $0.numberOfLines = 2
        $0.text = """
한 잔, 두 잔...
지금 몇 잔 째인가요?
"""
        $0.textAlignment = .center
        $0.textColor = .gray70
    }
    
    private let drinkingLabelStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
    }
    
    private lazy var drinkCupsLabel = UILabel().then {
        $0.font = .head(.h3SemiBold)
        $0.text = String(drinkCups)
        $0.textColor = .gray100
    }
    
    private let cupLabel1 = UILabel().then {
        $0.font = .head(.h6SemiBold)
        $0.text = "잔"
        $0.textColor = .gray100
    }
    
    private let slashLabel = UILabel().then {
        $0.font = .head(.h3SemiBold)
        $0.text = "/"
        $0.textColor = .gray30
    }
    private lazy var capacityCupsLabel = UILabel().then {
        $0.font = .head(.h3SemiBold)
        $0.text = String(capacityCups)
        $0.textColor = .gray30
        
    }
    
    private let cupLabel2 = UILabel().then {
        $0.font = .head(.h6SemiBold)
        $0.text = "잔"
        $0.textColor = .gray30
    }
    
    private let tapButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        let attributes: [NSAttributedString.Key: Any] = [.font : UIFont.head(.h1SemiBold)]
        let attributedTitle = AttributedString(NSAttributedString(string: "TAP", attributes: attributes))
        
        config.attributedTitle = attributedTitle
        config.baseBackgroundColor = .primary500
        config.background.cornerRadius = 82
        config.background.strokeColor = .primary200
        config.background.strokeWidth = 11.14
        $0.configuration = config
    }
    
    private let scrollView = UIScrollView()
    
    private let bottleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.spacing = 12
    }
    
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setHierarchy()
        setConstraints()
        setAddTarget()
    }
    
    private func setUI() {
        view.backgroundColor = .gray0
    }
    
    private func setHierarchy() {
        view.addSubviews(
            guideLabel,
            drinkingLabelStackView,
            tapButton,
            scrollView)
        
        drinkingLabelStackView.addArrangedSubviews(
            drinkCupsLabel,
            cupLabel1,
            slashLabel,
            capacityCupsLabel,
            cupLabel2)
        
        scrollView.addSubview(bottleStackView)
    }
    
    private func setConstraints() {
        guideLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(144)
            $0.centerX.equalToSuperview()
        }
        
        drinkingLabelStackView.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        tapButton.snp.makeConstraints {
            $0.top.equalTo(drinkingLabelStackView.snp.bottom).offset(76)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(164)
        }
        
        scrollView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.horizontalEdges.equalToSuperview().inset(28)
            $0.height.equalTo(110)
        }
        
        bottleStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        tapButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    private func addHalfBottle() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = .bottleHalf
        
        bottleStackView.addArrangedSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.width.equalTo(44)
            $0.height.equalTo(110)
        }
        
    }
    
    private func switchBottleImage() {
        guard let imageView = bottleStackView.arrangedSubviews.last as? UIImageView else { return }
        imageView.image = .bottleFull
    }
    
    private func updateBottle() {
        let bottles = drinkCups / 8
        let cups = drinkCups % 8
        
        if bottles > addedBottles {
            switchBottleImage()
            addedBottles += 1
        } else if cups == 4 {
            addHalfBottle()
        }
    }
    
    @objc func tappedButton() {
        let warningVC = WarningViewController()
        let capacityRest = capacityCups % 8
        
        drinkCups += 1
        updateBottle()
        
        warningVC.modalPresentationStyle = .overFullScreen
        warningVC.modalTransitionStyle = .flipHorizontal
        
        if drinkCups == capacityCups {
            self.present(warningVC, animated: true)
            isOverDrinking = true
            drinkCupsLabel.textColor = .red
        } else if isOverDrinking && drinkCups % 8 == capacityRest {
            self.present(warningVC, animated: true)
        }
    }
}
