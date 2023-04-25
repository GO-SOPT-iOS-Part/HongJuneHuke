//
//  SignInViewModel.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/23.
//

import Foundation

protocol SignInViewModelInput {
    func emailText(email: String)
    func passwordText(password: String)
    func signInButtonDidTap()
}

protocol SignInViewModelOutput {
    var isLoginButtonEnableUpdated: ((Bool) -> Void)? { get set }
}

protocol LoginViewModel: SignInViewModelInput, SignInViewModelOutput {}

final class SignInViewModel: LoginViewModel {
    
    // MARK: - Output
    
    var isLoginButtonEnableUpdated: ((Bool) -> Void)?
    var isLoginButtonEnable: Bool = false {
        didSet {
            isLoginButtonEnableUpdated?(isLoginButtonEnable)
        }
    }
    private var isValidEmail = false
    private var isValidPassword = false
    private var validUserEmail: String?
    
    private let useCase: SignInUseCase
    private var signInCoordinatore: SignInCoordinator?
    
    init(useCase: SignInUseCase, coordinator: SignInCoordinator) {
        self.useCase = useCase
        self.signInCoordinatore = coordinator
    }
}

extension SignInViewModel {
    
    // MARK: - Input
    
    func emailText(email: String) {
        isValidEmail = useCase.checkIsValidEmail(email: email)
        isLoginButtonEnable = isValidEmail && isValidPassword
        if isValidEmail {
            validUserEmail = email
        }
    }
    
    func passwordText(password: String) {
        isValidPassword = useCase.checkIsValidPassword(password: password)
        isLoginButtonEnable = isValidEmail && isValidPassword
    }
    
    func signInButtonDidTap() {
        signInCoordinatore?.startWelcomeView()
    }
}
