//
//  RegistrationVC.swift
//  JamHub
//
//  Created by Егорио on 07.02.2025.
//

import UIKit
import SnapKit

class RegistrationVC: UIViewController {
    
    private let logoView: UIView = {
        let view = UIView()
        view.backgroundColor = ApplicationColors.lighRoseColor
        return view
    }()
    
    private let greetingLabel = CustomLabel(text: "Добро пожаловать!", textColor: .label, textAlignment: .center, fontSize: 24, fontWeight: .bold)
    
    private let subtitleLabel = CustomLabel(text: "Войдите в свою учетную запись, чтобы продолжить", textAlignment: .center)
    
    private let emailLabel = CustomLabel(text: "Ваша электронная почта", fontSize: 16)
    
    private let emailTextField = CustomTextField(placeholder: "Введите электронную почту", image: UIImage(systemName: "envelope.fill"))
    
    private let passwordLabel = CustomLabel(text: "Ваш пароль", fontSize: 16)
    
    private let passwordTextField = CustomTextField(placeholder: "Введите ваш пароль", image: UIImage(systemName: "lock.fill"))
    
    private let authButton = CustomButton(text: "Войти", fontSize: 20, fontWeight: .regular)
    
    private let notRegisteredButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Еще нет аккаунта?", for: .normal)
        button.setTitleColor(ApplicationColors.lightPurpleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(ApplicationColors.lightPurpleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [notRegisteredButton, forgotPasswordButton])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupActions()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        [
            logoView,
            greetingLabel,
            subtitleLabel,
            emailLabel,
            emailTextField,
            passwordLabel,
            passwordTextField,
            authButton,
            buttonsStackView
        ].forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        logoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        greetingLabel.snp.makeConstraints { make in
            make.top.equalTo(logoView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(40)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        
        authButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.top.equalTo(authButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupActions() {
        // Добавить обработчики нажатий
    }
}

