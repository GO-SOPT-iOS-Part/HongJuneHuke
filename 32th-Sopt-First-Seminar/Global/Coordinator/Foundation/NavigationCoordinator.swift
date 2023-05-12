//
//  NavigationCoordinator.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/24.
//

import UIKit

protocol NavigationCoordinator: Coordinator {
    var navigationController: UINavigationController { get }
}
