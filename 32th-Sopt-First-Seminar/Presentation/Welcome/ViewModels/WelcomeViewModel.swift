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

final class WelcomeViewModel: WelcomeViewModelInput {
    
    private var welcomeCoordinator: WelcomeCoordinator?
    
    init(coordinator: WelcomeCoordinator) {
        self.welcomeCoordinator = coordinator
    }
}

extension WelcomeViewModel {
    
    // MARK: - Input
    
    func goMainButtonDidTap() {
        welcomeCoordinator?.didTapMainButton()
    }
}
