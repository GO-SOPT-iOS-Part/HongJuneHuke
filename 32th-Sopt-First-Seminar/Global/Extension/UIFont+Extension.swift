//
//  UIFont+Extension.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

enum FontName: String {
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
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
