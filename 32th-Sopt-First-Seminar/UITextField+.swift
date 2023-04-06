//
//  UITextField+.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/06.
//

import UIKit

extension UITextField {
    func setLeftPadding(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
