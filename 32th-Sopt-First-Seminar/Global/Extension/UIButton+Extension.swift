//
//  UIButton+Extension.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

extension UIButton {
    func canBeClicked() {
        self.backgroundColor = .tvingRed
        self.layer.borderWidth = 0
        self.isEnabled = true
        self.setTitleColor(.white, for: .normal)
    }
    
    func cannotBeClicked() {
        self.backgroundColor = .black
        self.layer.borderWidth = 1
        self.isEnabled = false
        self.layer.borderColor = UIColor.tvingGray4.cgColor
        self.setTitleColor(.tvingGray2, for: .normal)
    }
    
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
