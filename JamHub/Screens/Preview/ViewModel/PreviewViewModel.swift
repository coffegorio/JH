//
//  PreviewViewModel.swift
//  JamHub
//
//  Created by Егорио on 07.02.2025.
//

import Foundation

class PreviewViewModel {
    
    private weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToLogin() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.coordinator?.showLogin()
        }
        
    }
    
}
