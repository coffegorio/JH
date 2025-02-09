//
//  LoginViewModel.swift
//  JamHub
//
//  Created by Егорио on 08.02.2025.
//

import Foundation

class LoginViewModel {
    
    private weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator?) {
        self.coordinator = coordinator
    }
    
    func navigateToForgotPassword() {
        self.coordinator?.showForgotPassword()
    }
    
    func navigateToCreateAccount() {
        self.coordinator?.showCreateAccount()
    }
    
    
    
}
