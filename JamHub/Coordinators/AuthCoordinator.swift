//
//  AppCoordinator.swift
//  JamHub
//
//  Created by Егорио on 07.02.2025.
//

import UIKit

class AuthCoordinator: Coordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        let previewVC = PreviewVC()
        let previewViewModel = PreviewViewModel(coordinator: self)
        previewVC.viewModel = previewViewModel
        navigationController.setViewControllers([previewVC], animated: false)
    }
    
    func showLogin() {
        let loginVC = LoginVC()
        let loginViewModel = LoginViewModel(coordinator: self)
        loginVC.viewModel = loginViewModel
        navigationController.pushViewController(loginVC, animated: true)
    }

    
    func showForgotPassword() {
        let forgotPasswordVC = ForgotPasswordVC()
        let forgotPasswordViewModel = ForgotPasswordViewModel(coordinator: self)
        forgotPasswordVC.viewModel = forgotPasswordViewModel
        navigationController.pushViewController(forgotPasswordVC, animated: true)
    }
    
    func showCreateAccount() {
        let createAccontVC = CreateAccountVC()
        let createAccontViewModel = CreateAccountViewModel(coordinator: self)
        createAccontVC.viewModel = createAccontViewModel
        navigationController.pushViewController(createAccontVC, animated: true)
    }
}
