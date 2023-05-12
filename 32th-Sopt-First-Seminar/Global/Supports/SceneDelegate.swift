//
//  SceneDelegate.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/01.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
//        let loginVC = ModuleFactory.shared.makeLoginViewController()
        let weatherViewModel = WeatherViewModel()
        let navigationController = UINavigationController(rootViewController: WeatherViewController(viewModel: weatherViewModel))
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
