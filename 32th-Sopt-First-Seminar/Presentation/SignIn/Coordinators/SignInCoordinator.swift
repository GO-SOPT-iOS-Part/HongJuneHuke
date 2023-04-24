//
//  SignInCoordinator.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/24.
//
//
import UIKit

final class SignInCoordinator: BaseCoordinator {
    
//    var childCoordinators: [Coordinator] = []
//
//    private var navigationController: UINavigationController!
//
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
    
    override func start() {
        let signInUsecase = DefaultSignInUseCase()
        let signInViewModel = SignInViewModel(useCase: signInUsecase)
        let viewController = SignInViewController(viewModel: signInViewModel, coordinator: self)
        navigationController.viewControllers = [viewController]
    }
    
    func startWelcomeView() {
        let coordinator = WelcomeCoordinator(navigationController: navigationController)
        start(childCoordinator: coordinator)
    }
}
