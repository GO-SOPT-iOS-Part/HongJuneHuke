//
//  Coordinator.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
//    func start(childCoordinator: Coordinator)
//    func didFinish(childCoordinator: Coordinator)
}
