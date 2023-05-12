//
//  UIColor+Extension.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

extension UIColor {
    convenience init(r: Int, g: Int, b: Int) {
        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: 1
        )
    }
}

extension UIColor {

    static var tvingRed: UIColor {
        return UIColor(r: 255, g: 20, b: 60)
    }

    static var tvingBlack: UIColor {
        return UIColor(r: 0, g: 0, b: 0)
    }

    static var tvingWhite: UIColor {
        return UIColor(r: 255, g: 255, b: 255)
    }

    static var tvingGray1: UIColor {
        return UIColor(r: 214, g: 214, b: 214)
    }

    static var tvingGray2: UIColor {
        return UIColor(r: 156, g: 156, b: 156)
    }

    static var tvingGray3: UIColor {
        return UIColor(r: 98, g: 98, b: 98)
    }

    static var tvingGray4: UIColor {
        return UIColor(r: 46, g: 46, b: 46)
    }
    
    static var tvingGray5: UIColor {
        return UIColor(r: 25, g: 25, b: 25)
    }

}
