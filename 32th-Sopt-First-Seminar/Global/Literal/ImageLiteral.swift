//
//  ImageLiteral.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

enum ImageLiteral {
    
    // MARK: - Tving Image
    
    static var tvingIcon: UIImage { .load(name: "tvingImage") }
    
    // MARK: - navigation Item Image
    
    static var navigationBack: UIImage { .load(name: "navigationBack") }
    
    // MARK: - textField Image
    
    static var noSlashEye: UIImage { .load(name: "eye-noSlash") }
    static var slashEye: UIImage { .load(name: "eye-slash") }
    static var xCircle: UIImage { .load(name: "x-circle") }
    
    // MARK: - MyPage Image
    
    static var bearIcon: UIImage { .load(name: "BearsIcon") }
    static var coinIcon: UIImage { .load(name: "CoinIcon") }
    static var ticketIcon: UIImage { .load(name: "UsingIcon") }
    static var detailButton: UIImage { .load(name: "detailButton") }
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
    
    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = systemName
        return image
    }
}
