//
//  BaseViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: property
    
    // MARK: life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configUI()
        setupNavigationPopGesture()
        setupNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        NotificationCenter.default.removeObserver(self)
    }
    
    func render() {
        
    }
    
    func configUI() {
        view.backgroundColor = .white
    }
    
    // MARK: - helper func
    
    func makeBarButtonItem<T: UIView>(with view: T) -> UIBarButtonItem {
        return UIBarButtonItem(customView: view)
    }
        
    func setupNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        let appearance = UINavigationBarAppearance()
        
        appearance.shadowColor = .clear
        appearance.backgroundColor = .black

        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setupNavigationPopGesture() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
}
