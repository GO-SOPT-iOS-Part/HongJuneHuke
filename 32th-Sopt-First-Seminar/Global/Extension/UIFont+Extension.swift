//
//  UIFont+Extension.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

enum AppFontName: String {
    case pretendardBlack = "Pretendard-Black"
    case pretendardBold = "Pretendard-Bold"
    case pretendardExtraBold = "Pretendard-ExtraBold"
    case pretendardExtraLight = "Pretendard-ExtraLight"
    case pretendardLight = "Pretendard-Light"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardThin = "Pretendard-Thin"
}

extension UIFont {
    static func font(_ style: AppFontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? systemFont(ofSize: 15)
    }
    
    static var pretendardBlack: UIFont {
        return font(.pretendardBlack, ofSize: 24)
    }
    static var pretendardBold: UIFont {
        return font(.pretendardBold, ofSize: 20)
    }
    static var pretendardExtraBold: UIFont {
        return font(.pretendardExtraBold, ofSize: 20)
    }
    static var pretendardExtraLight: UIFont {
        return font(.pretendardExtraLight, ofSize: 16)
    }
    static var pretendardLight: UIFont {
        return font(.pretendardLight, ofSize: 14)
    }
    static var pretendardMedium: UIFont {
        return font(.pretendardMedium, ofSize: 15)
    }
    static var pretendardRegular: UIFont {
        return font(.pretendardRegular, ofSize: 14)
    }
    static var pretendardSemiBold: UIFont {
        return font(.pretendardSemiBold, ofSize: 14)
    }
    static var pretendardThin: UIFont {
        return font(.pretendardThin, ofSize: 10)
    }
}
