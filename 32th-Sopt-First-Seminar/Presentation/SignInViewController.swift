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
    private var isEmailValid = false
    private var userEmail: String?
    private var isPasswordValid = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
        bringFrontPasswordTextRightView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNotificationCenter()
    }
    
    override func render() {
        
        view.addSubview(signInView)
        
        signInView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let backButton = makeBarButtonItem(with: backButton)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func checkCanClickSignInButton() -> Bool {
        if isEmailValid && isPasswordValid { return true }
        else { return false }
    }
    
    private func bringFrontPasswordTextRightView() {
        signInView.superview?.bringSubviewToFront(signInView.nonSecureButton)
        signInView.superview?.bringSubviewToFront(signInView.secureButton)
        signInView.superview?.bringSubviewToFront(signInView.clearButton)
    }
}

// MARK: - set button action

extension SignInViewController {
    
    private func setButtonAction() {
        let moveToWelcomeViewAction = UIAction { [weak self] _ in
            self?.moveToWelcomeView()
        }
        let clearButtonTouchedAction = UIAction { [weak self] _ in
            self?.clearButtonTouched()
        }
        let secureButtonTouchedAction = UIAction { [weak self] _ in
            self?.secureButtonTouched()
        }
        let nonSecureButtonTouchedAction = UIAction { [weak self] _ in
            self?.nonSecureButtonTouched()
        }
        
        signInView.signInButton.addAction(moveToWelcomeViewAction, for: .touchUpInside)
        signInView.clearButton.addAction(clearButtonTouchedAction, for: .touchUpInside)
        signInView.secureButton.addAction(secureButtonTouchedAction, for: .touchUpInside)
        signInView.nonSecureButton.addAction(nonSecureButtonTouchedAction, for: .touchUpInside)
    }
    
    private func moveToWelcomeView() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.userEmail = self.userEmail
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    private func clearButtonTouched() {
        signInView.passwordTextField.text = ""
    }
    
    private func secureButtonTouched() {
        signInView.passwordTextField.isSecureTextEntry = true
        signInView.nonSecureButton.isHidden = false
        signInView.secureButton.isHidden = true
    }
    
    private func nonSecureButtonTouched() {
        signInView.passwordTextField.isSecureTextEntry = false
        signInView.nonSecureButton.isHidden = true
        signInView.secureButton.isHidden = false
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
            if text.isEmpty == false {
                userEmail = text
            }
            if text.isValidEmail() {
                isEmailValid = true
            } else {
                isEmailValid = false
            }
        }
        if checkCanClickSignInButton() {
            signInView.signInButton.canBeClicked()
            
        } else {
            signInView.signInButton.cannotBeClicked()
        }
    }
    
    @objc func passwordDidChange(noti: NSNotification) {
        if let text = signInView.passwordTextField.text {
            if text.isEmpty == false {
                signInView.secureButton.isHidden = false
                signInView.clearButton.isHidden = false
            } else {
                signInView.secureButton.isHidden = true
                signInView.clearButton.isHidden = true
            }
            if text.isEmpty == false {
                isPasswordValid = true
            } else {
                isPasswordValid = false
            }
        }
        if checkCanClickSignInButton() {
            signInView.signInButton.canBeClicked()
        } else {
            signInView.signInButton.cannotBeClicked()
        }
    }
}
