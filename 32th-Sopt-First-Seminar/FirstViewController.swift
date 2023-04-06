//
//  HelloViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/01.
//

import UIKit

final class FirstViewController: UIViewController {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요?"
        label.textAlignment = .center
        label.textColor = .red
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "여기 여기야~~ 여기에 써죠!! 제발!"
        textField.setLeftPadding(amount: 10)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        return textField
    }()

    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("프리젠트~", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(presentAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("푸쉬~", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
    
    @objc func presentAction() {
        let nextVC = SecondViewController()
        if let name = nameTextField.text {
            nextVC.name = name
        }
        self.navigationController?.present(nextVC, animated: true)
        
    }
    
    @objc func pushAction() {
        let nextVC = SecondViewController()
        if let name = nameTextField.text {
            nextVC.name = name
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

private extension FirstViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, nameTextField,
         presentButton, pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
        
    }
}
