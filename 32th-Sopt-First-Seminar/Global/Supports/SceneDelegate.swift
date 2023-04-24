//
//  SceneDelegate.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/01.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        let window = UIWindow(windowScene: windowScene)
//        self.window = window
//
//        let navigationController = UINavigationController()
//        self.window?.rootViewController = navigationController
//
//        let coordinator = AppCoordinator(navigationController: navigationController)
//        coordinator.start()
//
//        self.window?.makeKeyAndVisible()
        guard let windowScene = (scene as? UIWindowScene) else { return }
        // 2.
        self.window = UIWindow(windowScene: windowScene)
        // 3.
        let navigationController = UINavigationController(rootViewController: MyPageViewController())
        self.window?.rootViewController = navigationController
        // 4.
        self.window?.makeKeyAndVisible()
    }
}
