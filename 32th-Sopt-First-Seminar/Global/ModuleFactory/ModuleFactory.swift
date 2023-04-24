//
//  ModuleFactory.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/23.
//

import UIKit

protocol ModuleFactoryProtocol {
    func makeLoginViewController() -> UIViewController
    func makeWelcomeViewController() -> UIViewController
}

final class ModuleFactory: ModuleFactoryProtocol {
    static let shared = ModuleFactory()
    private init() {}

    func makeLoginViewController() -> UIViewController {
        let useCase = DefaultSignInUseCase()
        let viewModel: LoginViewModel = SignInViewModel(useCase: useCase)
        let viewController = SignInViewController(viewModel: viewModel)
        return viewController
    }

    func makeWelcomeViewController() -> UIViewController {
        let viewController = WelcomeViewController()
        return viewController
    }
}
