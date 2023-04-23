//
//  AppCoordinator.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/24.
//

import UIKit

import RxSwift

final class AppCoordinator: Coordinator {

    let window: UIWindow
    var childCoordinators: [Coordinator]

    init(window: UIWindow) {
        self.window = window
        self.childCoordinators = []
    }

    func start() {
        let loginViewController = ModuleFactory.shared.makeLoginViewController()
        window.rootViewController = loginViewController
        window.makeKeyAndVisible()
    }
    
    func start(childCoordinator: Coordinator) {
        self.childCoordinators = [childCoordinator]
        childCoordinator.start()
    }

    func didFinish(childCoordinator: Coordinator) {
        removeChildCoordinator(childCoordinator)
    }
}
