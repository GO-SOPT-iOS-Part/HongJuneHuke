//
//  WelcomeCoordinator.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/24.
//

import UIKit

final class WelcomeCoordinator: BaseCoordinator {
    
    var userEmail: String?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        guard let userEmail = userEmail else { return }
        let welcomeViewModel = WelcomeViewModel(coordinator: self, userEmail: userEmail)
        let viewController = WelcomeViewController(viewModel: welcomeViewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    // MARK: - HomeView 개발 전까지는 마이페이지 뷰로 연결
    func didTapMainButton() {
        let coordinator = MyPageCoordinator(navigationController: navigationController)
        start(childCoordinator: coordinator)
    }
}
