//
//  UIView+Extensioin.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
