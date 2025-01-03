//
//  ExcuseViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 송여경 on 11/23/24.
//
//
//  ExcuseViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 송여경 on 11/23/24.
//

import UIKit

import SnapKit
import Then
import Kingfisher

class ExcuseViewController: UIViewController {
    
    private let randomService = RandomService()
    
    private let whiteBackgroundView = UIImageView().then {
        $0.image = UIImage(named: "dim")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private lazy var keepGoingButton = UIButton().then {
        $0.titleLabel?.font = .body(.b4SemiBold)
        $0.setTitle("지금까지 마신 술 다시보기", for: .normal)
        $0.setTitleColor(.gray0, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .primary500
        $0.addTarget(self, action: #selector(goToMainViewController), for: .touchUpInside)
    }
    
    private let anotherExcuseButton = UIButton().then {
        $0.titleLabel?.font = .body(.b5Medium)
        $0.setTitle("다른 핑계 보기", for: .normal)
        $0.setImage(UIImage(named: "excusebutton"), for: .normal)
    }
    
    private let touchInfoLabel = UILabel().then {
        $0.text = "사진 터치해서 전체화면"
        $0.textColor = .gray20
        $0.font = .body(.b5Regular)
    }
    
    private let excuseImageView = UIImageView().then {
        $0.backgroundColor = .gray30
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
    }
    
    private var currentImageURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setupActions()
        fetchRandomImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setStyle() {
        self.view.backgroundColor = .gray0
    }
    
    private func setUI() {
        self.view.addSubviews(
            whiteBackgroundView,
            anotherExcuseButton,
            excuseImageView,
            keepGoingButton,
            touchInfoLabel
        )
    }
    
    private func setLayout() {
        whiteBackgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        keepGoingButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
            $0.leading.equalTo(31)
            $0.width.equalTo(314)
            $0.height.equalTo(56)
        }
        
        anotherExcuseButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(120)
            $0.leading.equalToSuperview().offset(119)
            $0.height.equalTo(40)
        }
        
        excuseImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(anotherExcuseButton.snp.bottom).offset(24)
            $0.width.equalTo(279)
            $0.height.equalTo(380)
        }
        
        touchInfoLabel.snp.makeConstraints {
            $0.top.equalTo(excuseImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setupActions() {
        anotherExcuseButton.addTarget(self, action: #selector(fetchRandomImage), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showFullScreenImage))
        excuseImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func fetchRandomImage() {
        NetworkService.shared.randomServixe.getRandomImage { response in
            switch response {
            case .success(let randomImage):
                guard let imageURL = randomImage?.imgUrl else {
                    print("Image URL is nil")
                    return
                }
                print("kljfskjhfkjsaf",imageURL)
                self.currentImageURL = imageURL
                self.loadImage(from: imageURL)
            default:
                print("Unexpected error occurred")
            }
        }
    }

    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        excuseImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [
            .transition(.fade(0.3)),
            .cacheOriginalImage
        ])
    }
    
    @objc private func showFullScreenImage() {
        let previewVC = ImagePreviewViewController()
        previewVC.imageURL = currentImageURL
        navigationController?.pushViewController(previewVC, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc private func goToMainViewController() {
        let mainVC = MainViewController()
        navigationController?.pushViewController(mainVC, animated: true)
    }
}
