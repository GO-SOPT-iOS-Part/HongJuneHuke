//
//  HomeViewCoordinator.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/24.
//

import UIKit

final class HomeViewCoordinator: BaseCoordinator {

//    var childCoordinators: [Coordinator] = []
//
//    private var navigationController: UINavigationController!
//
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
    
    override func start() {
        let viewController = HomeViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
