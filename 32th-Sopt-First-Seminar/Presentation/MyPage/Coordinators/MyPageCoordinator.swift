//
//  MyPageCoordinator.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/25.
//

import Foundation

final class MyPageCoordinator: BaseCoordinator {
    override func start() {
        let viewController = MyPageViewController(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
}
