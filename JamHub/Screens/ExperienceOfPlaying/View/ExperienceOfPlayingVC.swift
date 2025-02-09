//
//  ExperienceOfPlayingVC.swift
//  JamHub
//
//  Created by Егорио on 09.02.2025.
//

import UIKit
import SnapKit

class ExperienceOfPlayingVC: UIViewController {
    
    private let titleLabel = CustomLabel(text: "Привет! Был ли у тебя опыт игры на гитаре?", textAlignment: .left, fontWeight: .bold)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        setupActions()
        
    }
    
    private func setupUI() {
        
        self.view.backgroundColor = .systemBackground
        
        [
            titleLabel,
            
        ].forEach { view.addSubview($0) }
        
    }
    
    private func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
    }
    
    private func setupActions() {
        
    }
    
}
