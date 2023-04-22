//
//  BackButton.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

import SnapKit

final class BackButton: UIButton {
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }
    
    private func configUI() {
        self.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        self.setImage(ImageLiteral.navigationBack, for: .normal)
        self.tintColor = UIColor.tvingGray1
    }
}
