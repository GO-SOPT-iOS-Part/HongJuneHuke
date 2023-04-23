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
    var userEmail: String? {
        didSet {
            if let userEmail = userEmail {
                welcomeView.welcomeText.text = userEmail + " 님\n반가워요!"
            }
        }
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
