//
//  SignInViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

import SnapKit

final class SignInViewController: BaseViewController {

    // MARK: - property
    
    let signInView = SignInView()
    
    override func render() {
        
        view.addSubview(signInView)
        
        signInView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
