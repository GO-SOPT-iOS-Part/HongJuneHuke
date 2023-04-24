//
//  WelcomeCoordinator.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/24.
//

import UIKit

final class WelcomeCoordinator: BaseCoordinator {
    override func start() {
        let viewController = WelcomeViewController(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func didTapMainButton() {
        let coordinator = HomeViewCoordinator(navigationController: navigationController)
        start(childCoordinator: coordinator)
    }
}
