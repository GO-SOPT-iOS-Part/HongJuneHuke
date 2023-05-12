//
//  MyPageViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/25.
//

import UIKit

import SnapKit

final class MyPageViewController: BaseViewController {
    
    private let myPageTableView = MyPageTableView(frame: CGRect(), style: .grouped)
    private let backButton = BackButton(type: .system)
    private let myPageCoordinator: MyPageCoordinator?
    
    init(coordinator: MyPageCoordinator) {
        self.myPageCoordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     override func setView() {
        self.view = myPageTableView
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let backButton = makeBarButtonItem(with: backButton)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = backButton
        
        let alertButton = UIBarButtonItem(image: ImageLiteral.navigationAlertButton, style: .plain, target: self, action: #selector(navigationAction))
        let settingButton = UIBarButtonItem(image: ImageLiteral.navigationSettingButton, style: .plain, target: self, action: #selector(navigationAction))
        navigationItem.setRightBarButtonItems([alertButton, settingButton], animated: true)
    }
    
    @objc
    private func navigationAction() {}
}
