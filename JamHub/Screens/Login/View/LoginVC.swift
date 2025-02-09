//
//  RegistrationVC.swift
//  JamHub
//
//  Created by Егорио on 07.02.2025.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    var viewModel: LoginViewModel!
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
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
        stackView.spacing = 30
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: - Жизненный цикл
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        setupActions()
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Добавляем scrollView и contentView
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.delaysContentTouches = false
        
        // Добавляем все элементы интерфейса в contentView
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
        ].forEach { contentView.addSubview($0) }
    }
    
    // MARK: - Constraints Setup
    private func setupConstraints() {
        // Ограничиваем scrollView краями safeArea
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        logoView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(50)
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
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: - Actions Setup
    private func setupActions() {
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        notRegisteredButton.addTarget(self, action: #selector(notRegisteredTapped), for: .touchUpInside)
    }
    
    @objc private func forgotPasswordTapped() {
        viewModel.navigateToForgotPassword()
    }
    
    @objc private func notRegisteredTapped() {
        viewModel.navigateToCreateAccount()
    }
    
    
    // MARK: - Keyboard Handling
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }
        
        let keyboardHeight = keyboardFrame.height
        UIView.animate(withDuration: duration) {
            self.scrollView.contentInset.bottom = keyboardHeight
            self.scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }
        
        UIView.animate(withDuration: duration) {
            self.scrollView.contentInset.bottom = 0
            self.scrollView.verticalScrollIndicatorInsets.bottom = 0
        }
    }
}
