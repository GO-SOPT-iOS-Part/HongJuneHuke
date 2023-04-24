//
//  WelcomeViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/21.
//

import UIKit

import SnapKit

class WelcomeViewController: BaseViewController {
    
    private let welcomeView = WelcomeView()
    private var welcomeCoordinator: WelcomeCoordinator?
    var userEmail: String? {
        didSet {
            if let userEmail = userEmail {
                welcomeView.welcomeText.text = userEmail + " 님\n반가워요!"
            }
        }
    }
    
    init(coordinator: WelcomeCoordinator) {
        self.welcomeCoordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
    }

    override func render() {
        
        view.addSubview(welcomeView)
        
        welcomeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setupNavigationBar() {
        self.navigationItem.hidesBackButton = true
    }
}

// MARK: - set button action

extension WelcomeViewController {
    private func setButtonAction() {
        let mainButtonAction = UIAction { [weak self] _ in
            self?.mainButtonAction()
        }

        welcomeView.goMainButton.addAction(mainButtonAction, for: .touchUpInside)
    }
    
    func mainButtonAction() {
        self.welcomeCoordinator?.didTapMainButton()
    }
}
