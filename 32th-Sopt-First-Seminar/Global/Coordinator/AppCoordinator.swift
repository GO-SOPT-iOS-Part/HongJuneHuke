//
//  AppCoordinator.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/24.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!
    
    func start() {
        showSignInViewController()
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private func showSignInViewController() {
        let signInCoordinator = SignInCoordinator(navigationController: navigationController)
        signInCoordinator.start()
        childCoordinators.append(signInCoordinator)
    }
}
