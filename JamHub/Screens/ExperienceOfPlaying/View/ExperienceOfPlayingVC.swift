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
    private let neverButton = CustomButton(text: "Я никогда не играл", fontSize: 16, fontWeight: .regular)
    private let beginnerButton = CustomButton(text: "Я начал играть недавно", fontSize: 16, fontWeight: .regular)
    private let intermediateButton = CustomButton(text: "Я играю на неплохом уровне", fontSize: 16, fontWeight: .regular)
    private let advancedButton = CustomButton(text: "Я - профи", fontSize: 16, fontWeight: .regular)
    
    private lazy var buttonsStackView: UIStackView = {
        let buttonsView = UIStackView(arrangedSubviews: [neverButton, beginnerButton, intermediateButton, advancedButton])
        buttonsView.axis = .vertical
        buttonsView.spacing = 20
        buttonsView.alignment = .center
        return buttonsView
    }()
    
    
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
            buttonsStackView
            
        ].forEach { view.addSubview($0) }
        
    }
    
    private func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
    }
    
    private func setupActions() {
        
    }
    
}
