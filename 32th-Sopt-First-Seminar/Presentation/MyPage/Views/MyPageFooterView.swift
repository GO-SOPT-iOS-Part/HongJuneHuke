//
//  MyPageFooterView.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/25.
//

import UIKit

import SnapKit

final class MyPageFooterView: BaseUIView {
    
    // MARK: - property
    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextLiteral.signOutButtonText, for: .normal)
        button.cannotBeClicked()
        button.layer.cornerRadius = 4
        return button
    }()
    
    override func render() {
        self.addSubview(signOutButton)
        
        signOutButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(23)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.width.equalTo(360)
        }
    }
}
