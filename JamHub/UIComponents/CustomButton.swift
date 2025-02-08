//
//  CustomButton.swift
//  JamHub
//
//  Created by Егорио on 08.02.2025.
//

import UIKit

class CustomButton: UIButton {

    init(
        text: String,
        fontSize: CGFloat,
        fontWeight: UIFont.Weight,
        backgroundColor: UIColor = ApplicationColors.lightPurpleColor,
        textColor: UIColor = .white
    ) {
        super.init(frame: .zero)

        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)

        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.05) {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.9, y: 0.9) : .identity
            }
        }
    }
}
