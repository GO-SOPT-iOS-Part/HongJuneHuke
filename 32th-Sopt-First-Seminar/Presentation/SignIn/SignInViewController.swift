//
//  SignInViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

import SnapKit

final class SignInViewController: BaseViewController {

    private var signInViewModel: SignInViewModel?
    private var userEmail: String?
    
    // MARK: - property
    
    private let signInView = SignInView()
    private let backButton = BackButton(type: .system)
    private var isEmailValid = false
    private var isPasswordValid = false

    // MARK: - View Life Cycle
    
    init(viewModel: LoginViewModel) {
        self.signInViewModel = viewModel as? SignInViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
        bind()
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

    private func bind() {
        self.signInViewModel?.isLoginButtonEnableUpdated = { [weak self] isEnable in
            self?.signInView.signInButton.isUserInteractionEnabled = isEnable
            if isEnable {
                self?.signInView.signInButton.canBeClicked()
            } else {
                self?.signInView.signInButton.cannotBeClicked()
            }
        }
    }
}

// MARK: - set button action

extension SignInViewController {
    
    private func setButtonAction() {
        let moveToWelcomeViewAction = UIAction { [weak self] _ in
            self?.moveToWelcomeView()
        }

        signInView.signInButton.addAction(moveToWelcomeViewAction, for: .touchUpInside)
    }
    
    private func moveToWelcomeView() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.userEmail = self.userEmail
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
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
            self.userEmail = text
            self.signInViewModel?.emailText(email: text)
        }
    }
    
    @objc func passwordDidChange(noti: NSNotification) {
        if let text = signInView.passwordTextField.text {
            self.userEmail = text
            self.signInViewModel?.passwordText(password: text)
        }
    }
}
