//
//  SceneDelegate.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/01.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var coordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        coordinator = AppCoordinator(window: window)
        coordinator?.start()
    }
}
