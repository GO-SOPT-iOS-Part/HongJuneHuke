//
//  WelcomeViewModel.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/25.
//

import Foundation

protocol WelcomeViewModelInput {
    func goMainButtonDidTap()
}

protocol WelcomeViewModelOutput {
    var updateUserEmail: ((String) -> Void)? { get set }
}

protocol WelcomeViewModelInputOutput: WelcomeViewModelInput, WelcomeViewModelOutput {}

final class WelcomeViewModel: WelcomeViewModelInputOutput {

    // MARK: - Output
    
    private var welcomeCoordinator: WelcomeCoordinator?
    
    var updateUserEmail: ((String) -> Void)?
    
    init(coordinator: WelcomeCoordinator, userEmail: String) {
        self.welcomeCoordinator = coordinator
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.updateUserEmail?(userEmail)
        }
    }
}

extension WelcomeViewModel {
    
    // MARK: - Input
    
    func goMainButtonDidTap() {
        welcomeCoordinator?.didTapMainButton()
    }
}
