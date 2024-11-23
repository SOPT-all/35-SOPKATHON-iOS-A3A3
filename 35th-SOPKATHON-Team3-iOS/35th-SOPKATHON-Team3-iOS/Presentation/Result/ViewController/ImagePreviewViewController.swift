//
//  ImagePreviewViewController.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 송여경 on 11/24/24.
//

import UIKit

import SnapKit
import Then
import Kingfisher

class ImagePreviewViewController: UIViewController {
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    private lazy var closeButton = UIButton().then {
        $0.setTitle("X", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        $0.backgroundColor = .clear
    }
    
    var imageURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        setupActions()
        loadImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubviews(imageView, closeButton)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.height.equalToSuperview().multipliedBy(0.8)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(30)
        }
    }
    
    private func loadImage() {
        guard let imageURL = imageURL, let url = URL(string: imageURL) else { return }
        
        imageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [
            .transition(.fade(0.3)),
            .cacheOriginalImage
        ])
    }
    
    private func setupActions() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

