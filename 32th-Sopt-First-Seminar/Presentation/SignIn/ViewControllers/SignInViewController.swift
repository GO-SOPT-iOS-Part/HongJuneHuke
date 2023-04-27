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
    
    private let signInView = SignInView()
    private let backButton = BackButton(type: .system)
    private var signInViewModel: LoginViewModel?

    // MARK: - View Life Cycle
    
    init(viewModel: SignInViewModel) {
        self.signInViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bind()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setView() {
        self.view = signInView
    }

    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let backButton = makeBarButtonItem(with: backButton)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = backButton
    }

    private func bind() {
        self.signInViewModel?.isLoginButtonEnableUpdated = { [weak self] isEnable in
            self?.signInView.signInButton.isUserInteractionEnabled = isEnable
            if isEnable {
                self?.signInView.signInButton.canBeClicked()
            } else {
                self?.signInView.signInButton.cannotBeClicked()
            }
        }
        setButtonAction()
        setupNotificationCenter()
    }
}

// MARK: - set button action

extension SignInViewController {
    private func setButtonAction() {
        let loginButtonAction = UIAction { [weak self] _ in
            self?.signInViewModel?.signInButtonDidTap()
        }

        signInView.signInButton.addAction(loginButtonAction, for: .touchUpInside)
    }
}

// MARK: - set notification

extension SignInViewController {
    
    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(emailDidChange), name: UITextField.textDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(passwordDidChange), name: UITextField.textDidChangeNotification, object: nil)
    }
    
    @objc func emailDidChange(noti: NSNotification) {
        if let text = signInView.idTextField.text {
            self.signInViewModel?.emailText(email: text)
        }
    }
    
    @objc func passwordDidChange(noti: NSNotification) {
        if let text = signInView.passwordTextField.text {
            self.signInViewModel?.passwordText(password: text)
        }
    }
}
