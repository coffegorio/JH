//
//  ForgotPasswordVC.swift
//  JamHub
//
//  Created by Егорио on 08.02.2025.
//

import UIKit
import SnapKit

class ForgotPasswordVC: UIViewController {
    
    var viewModel: ForgotPasswordViewModel!
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let logoView: UIView = {
        let view = UIView()
        view.backgroundColor = ApplicationColors.lighRoseColor
        return view
    }()
    
    private let titleLabel = CustomLabel(
        text: "Восстановление пароля",
        textColor: .label,
        textAlignment: .center,
        fontSize: 24,
        fontWeight: .bold
    )
    
    private let subtitleLabel = CustomLabel(
        text: "Введите свою почту, и мы отправим вам инструкцию для сброса пароля.",
        textAlignment: .center
    )
    
    private let emailLabel = CustomLabel(text: "Ваша электронная почта", fontSize: 16)
    
    private let emailTextField = CustomTextField(
        placeholder: "Введите электронную почту",
        image: UIImage(systemName: "envelope.fill")
    )
    
    private let resetButton = CustomButton(text: "Сбросить пароль", fontSize: 20, fontWeight: .regular)
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Назад ко входу", for: .normal)
        button.setTitleColor(ApplicationColors.lightPurpleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return button
    }()
    
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
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.delaysContentTouches = false
        
        [
            logoView,
            titleLabel,
            subtitleLabel,
            emailLabel,
            emailTextField,
            resetButton,
            backButton
        ].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
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
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
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
        
        resetButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(resetButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    private func setupActions() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        viewModel.navigateBack()
    }
    
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

