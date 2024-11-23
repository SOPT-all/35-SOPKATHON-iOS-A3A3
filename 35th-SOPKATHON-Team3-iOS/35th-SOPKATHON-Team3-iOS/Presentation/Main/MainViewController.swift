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
    
    private var addedBottles: Int = 0
    private var drinkCups: Int = 0 {
        didSet {
            drinkCupsLabel.text = String(drinkCups)
        }
    }
    private var capacityCups: Int = 8
    
    private var isOverDrinking: Bool = false
    
    // UI
    private let backButtonView = UIView()
    
    private let chevronLeftImageView = UIImageView().then {
        $0.image = .customChevronLeft
        $0.tintColor = .gray60
    }
    
    private let backButtonlabel = UILabel().then {
        $0.font = .body(.b5Medium)
        $0.text = "주량 다시 입력하기"
        $0.textColor = .gray60
    }
    
    private let backButton = UIButton()
    
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
        var config = UIButton.Configuration.plain()
        config.image = .tapBefore
        
        var highlightedConfig = UIButton.Configuration.plain()
        highlightedConfig.image = .tapWhile
        
        $0.configurationUpdateHandler = { button in
            switch button.state {
            case .highlighted:
                button.configuration = highlightedConfig
            default:
                button.configuration = config
            }
        }
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
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButtonView)
    }
    
    private func setHierarchy() {
        view.addSubviews(
            backButtonView,
            guideLabel,
            drinkingLabelStackView,
            tapButton,
            scrollView)
        
        backButtonView.addSubviews(chevronLeftImageView,
                                   backButtonlabel,
                                   backButton)
        
        drinkingLabelStackView.addArrangedSubviews(
            drinkCupsLabel,
            cupLabel1,
            slashLabel,
            capacityCupsLabel,
            cupLabel2)
        
        scrollView.addSubview(bottleStackView)
    }
    
    private func setConstraints() {
//        backButtonView.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(10)
//            $0.top.equalToSuperview()
//        }
        
        
        chevronLeftImageView.snp.makeConstraints {
            $0.height.equalTo(18)
        }
        
        backButtonlabel.snp.makeConstraints {
            $0.leading.equalTo(chevronLeftImageView.snp.trailing).offset(8)
            $0.centerY.equalTo(chevronLeftImageView)
        }
        
        backButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
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
            $0.height.equalTo(171)
        }
        
        bottleStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        tapButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
    }
    
    private func addHalfBottle() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = .bottleHalf
        
        bottleStackView.addArrangedSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.width.equalTo(88)
            $0.height.equalTo(171)
        }
        
    }
    
    private func switchBottleImage() {
        guard let imageView = bottleStackView.arrangedSubviews.last as? UIImageView else { return }
        imageView.image = .bottleWhole
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
        warningVC.modalTransitionStyle = .crossDissolve
        
        if drinkCups == capacityCups {
            self.present(warningVC, animated: true)
            isOverDrinking = true
            drinkCupsLabel.textColor = .redError
            cupLabel1.textColor = .redError
        } else if isOverDrinking && drinkCups % 8 == capacityRest {
            self.present(warningVC, animated: true)
        }
    }
    
    @objc func tappedBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
