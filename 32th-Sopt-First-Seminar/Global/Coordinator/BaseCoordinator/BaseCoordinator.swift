//
//  BaseCoordinator.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/24.
//

import UIKit

class BaseCoordinator: NavigationCoordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        fatalError("Start method must be implemented")
    }

    func start(childCoordinator: Coordinator) {
        addChildCoordinator(childCoordinator)
        childCoordinator.start()
    }

    func didFinish(childCoordinator: Coordinator) {
        removeChildCoordinator(childCoordinator)
    }
    
    func removeChildCoordinators() {
        removeAllChildCoordinators()
    }
}
