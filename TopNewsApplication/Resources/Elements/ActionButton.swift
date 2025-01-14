//
//  ActionButton.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 13.01.2025.
//

import UIKit

final class ActionButton: UIButton {
    private enum Constants {
        static let minimumWidth = 150.0
        static let maximumWidth = 316.0
        static let height = 52.0
    }

    @IBInspectable var normalBackgroundColor: UIColor = .eucalyptus {
        didSet {
            if !isHighlighted {
                backgroundColor = normalBackgroundColor
            }
        }
    }

    var isAnimated: Bool = false {
        didSet {
            isAnimated ? addGradientAnimation() : removeGradientAnimation()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2.0
    }

    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
        }
    }
}

// MARK: - Private methods
private extension ActionButton {
    func commonInit() {
        backgroundColor = normalBackgroundColor
        titleLabel?.font = .appFont(.medium, size: .h16)
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.textAlignment = .natural
        setTitleColor(.white, for: .normal)
    }

    func addGradientAnimation() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = frame.height / 2
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.gin.cgColor, UIColor.eucalyptus.cgColor]
        gradientLayer.locations = [1.0, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)

        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [UIColor.gin.cgColor, UIColor.eucalyptus.cgColor]
        animation.toValue = [UIColor.eucalyptus.cgColor, UIColor.gin.cgColor]
        animation.duration = 1.5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        gradientLayer.add(animation, forKey: "gradientAnimation")
    }

    func removeGradientAnimation() {
        if let gradientLayer = layer.sublayers?.first(where: { $0 is CAGradientLayer }) as? CAGradientLayer {
            gradientLayer.removeAnimation(forKey: "gradientAnimation")
            gradientLayer.removeFromSuperlayer()
        }
    }
}
