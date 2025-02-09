//
//  Coordinator.swift
//  JamHub
//
//  Created by Егорио on 08.02.2025.
//

import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    func start()
    
}
