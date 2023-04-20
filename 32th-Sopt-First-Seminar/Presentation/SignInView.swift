//
//  SignInView.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/20.
//

import UIKit

import SnapKit

class SignInView: BaseUIView {
    
    // MARK: - property
    
    private let signInHeadLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pretendardMedium
        label.text = TextLiteral.signInViewHeadLabel
        label.textColor = .tvingGray1
        label.textAlignment = .center
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .tvingGray4
        textField.setLeftPadding(amount: 22)
        textField.layer.cornerRadius = 3
        textField.attributedPlaceholder = NSAttributedString(
            string: TextLiteral.idLabelText,
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.tvingGray2]
        )
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .tvingGray4
        textField.setLeftPadding(amount: 22)
        textField.layer.cornerRadius = 3
        textField.attributedPlaceholder = NSAttributedString(
            string: TextLiteral.passwordLabelText,
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.tvingGray2]
        )
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.cannotBeClicked()
        button.setTitle(TextLiteral.signInButtonText, for: .normal)
        button.layer.cornerRadius = 3
        return button
    }()
    
    private let findIdButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextLiteral.findIdButtonText, for: .normal)
        button.setTitleColor(.tvingGray2, for: .normal)
        return button
    }()
    
    private let midSplitLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiteral.splitLabel
        label.textColor = .tvingGray4
        return label
    }()
    
    private let findPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextLiteral.findPassWordButtonText, for: .normal)
        button.setTitleColor(.tvingGray2, for: .normal)
        return button
    }()
    
    private let isThereNoIdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.pretendardSemiBold
        label.text = TextLiteral.isThereNoIdLabel
        label.textColor = .tvingGray3
        label.textAlignment = .center
        return label
    }()
    
    private let makeNameButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextLiteral.makeNameButtonText, for: .normal)
        button.setTitleColor(.tvingGray2, for: .normal)
        button.titleLabel?.font = UIFont.pretendardRegular
        button.setUnderline()
        return button
    }()
    
    private let findButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 33
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private let makeIdButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 17
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    override func render() {

        findButtonStackView.addArrangedSubviews(
            findIdButton,
            midSplitLabel,
            findPasswordButton
        )
        
        makeIdButtonStackView.addArrangedSubviews(
            isThereNoIdLabel,
            makeNameButton
        )
        
        self.addSubviews(
            signInHeadLabel,
            idTextField,
            passwordTextField,
            signInButton,
            findButtonStackView,
            makeIdButtonStackView
        )
        
        signInHeadLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(signInHeadLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        findButtonStackView.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(70)
            $0.height.equalTo(22)
        }
        
        makeIdButtonStackView.snp.makeConstraints {
            $0.top.equalTo(findButtonStackView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(22)
        }
    }
    
    override func configUI() {
        self.backgroundColor = .black
    }
}
