//
//  UIButton+Extension.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

extension UIButton {
    func canBeClicked(button: UIButton) {
        button.backgroundColor = .tvingRed
        button.layer.borderColor = UIColor.tvingRed.cgColor
        button.setTitleColor(.white, for: .normal)
    }
    
    func cannotBeClicked(button: UIButton) {
        button.backgroundColor = .black
        button.layer.borderColor = UIColor.tvingGray4.cgColor
        button.setTitleColor(.tvingGray2, for: .normal)
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
