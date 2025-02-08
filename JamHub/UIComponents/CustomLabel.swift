//
//  CustomLabel.swift
//  JamHub
//
//  Created by Егорио on 07.02.2025.
//

import UIKit

class CustomLabel: UILabel {
    
    init(
        text: String = "",
        textColor: UIColor = .label,
        textAlignment: NSTextAlignment = .left,
        fontSize: CGFloat = 18,
        fontWeight: UIFont.Weight = .regular
    ) {
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
