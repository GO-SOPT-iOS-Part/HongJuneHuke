//
//  String+Extension.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
