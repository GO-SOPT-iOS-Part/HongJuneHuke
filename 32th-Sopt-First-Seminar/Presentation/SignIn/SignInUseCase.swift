//
//  SignInUseCase.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/23.
//

import Foundation

protocol SignInUseCase {
    func checkIsValidEmail(email: String) -> Bool
    func checkIsValidPassword(password: String) -> Bool
}

final class DefaultSignInUseCase: SignInUseCase {
    
    func checkIsValidEmail(email: String) -> Bool {
        return email.isValidEmail()
    }
    
    func checkIsValidPassword(password: String) -> Bool {
        return !password.isEmpty
    }
}
