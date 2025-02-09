//
//  CustomTextField.swift
//  JamHub
//
//  Created by Егорио on 08.02.2025.
//

import UIKit

class CustomTextField: UITextField, UITextFieldDelegate {
    
    private let padding: CGFloat = 12
    private let leftImageView: UIImageView?
    
    init(placeholder: String, image: UIImage?) {
        self.leftImageView = image != nil ? UIImageView(image: image) : nil
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        self.font = UIFont.systemFont(ofSize: 16)
        self.textColor = .label
        self.backgroundColor = .systemBackground
        self.autocorrectionType = .no
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = ApplicationColors.lighRoseColor.cgColor
        self.returnKeyType = .done
        self.delegate = self 
        
        setupLeftView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLeftView() {
        guard let leftImageView = leftImageView else { return }
        
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.tintColor = ApplicationColors.lightPurpleColor
        leftImageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        leftImageView.center = paddingView.center
        paddingView.addSubview(leftImageView)
        
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding + 30, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding + 30, dy: 0)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

