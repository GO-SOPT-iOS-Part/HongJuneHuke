//
//  SignInCoordinator.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/24.
//
//

import UIKit

final class SignInCoordinator: BaseCoordinator {
    override func start() {
        let signInUsecase = DefaultSignInUseCase()
        let signInViewModel = SignInViewModel(useCase: signInUsecase, coordinator: self)
        let viewController = SignInViewController(viewModel: signInViewModel)
        navigationController.viewControllers = [viewController]
    }
    
    func startWelcomeView(userEmail: String) {
        let coordinator = WelcomeCoordinator(navigationController: navigationController)
        coordinator.userEmail = userEmail
        start(childCoordinator: coordinator)
    }
}
