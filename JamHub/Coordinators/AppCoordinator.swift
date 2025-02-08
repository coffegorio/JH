//
//  AppCoordinator.swift
//  JamHub
//
//  Created by Егорио on 07.02.2025.
//

import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    func start()
    
}

class AppCoordinator: Coordinator {

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
    
    func showRegistration() {
        let registrationVC = RegistrationVC()
        navigationController.pushViewController(registrationVC, animated: true)
    }
    
}
