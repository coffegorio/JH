//
//  CreateAccountViewModel.swift
//  JamHub
//
//  Created by Егорио on 08.02.2025.
//

import Foundation

class CreateAccountViewModel {
    
    private weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateBack() {
        self.coordinator?.showLogin()
    }
    
}
