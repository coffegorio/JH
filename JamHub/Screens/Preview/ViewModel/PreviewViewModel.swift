//
//  PreviewViewModel.swift
//  JamHub
//
//  Created by Егорио on 07.02.2025.
//

import Foundation

class PreviewViewModel {
    
    private weak var coordinator: AppCoordinator?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToRegistration() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.coordinator?.showRegistration()
        }
        
    }
    
}
