//
//  WelcomeView.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/21.
//

import UIKit

import SnapKit

final class WelcomeView: BaseUIView {
    
    // MARK: - property
    
    private let headImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.tvingIcon
        return imageView
    }()
    
    let welcomeText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.pretendardSemiBold
        label.textColor = .white
        return label
    }()
    
    let goMainButton: UIButton = {
        let button = UIButton()
        button.canBeClicked()
        button.setTitle(TextLiteral.goMainButtonText, for: .normal)
        button.layer.cornerRadius = 3
        return button
    }()
    
    override func render() {
        
        self.addSubviews(
            headImageView,
            welcomeText,
            goMainButton
        )
        
        headImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        welcomeText.snp.makeConstraints{
            $0.top.equalTo(headImageView.snp.bottom).offset(60)
            $0.centerX.equalTo(headImageView)
        }
        
        goMainButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(70)
        }
    }
}
