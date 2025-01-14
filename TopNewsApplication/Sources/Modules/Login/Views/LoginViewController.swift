//
//  LoginViewController.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

final class LoginViewController: UIViewController, Instantiatable {
    @IBOutlet private var loginButton: ActionButton!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var emailTitleLabel: UILabel!
    @IBOutlet private var passwordTitleLabel: UILabel!
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    var output: LoginViewControllerOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isAnimated = true
        setupLabels()
        configureTextField(with: "Please enter your email", for: emailTextField)
        configureTextField(with: "Please enter your password", for: passwordTextField)
        loginButton.setTitle("Sign in", for: .normal)
    }
    
    private func configureTextField(with text: String, for textField: UITextField) {
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8.0, height: textField.frame.height))
        textField.leftViewMode = .always
        
        textField.layer.cornerCurve = .continuous
        textField.layer.cornerRadius = textField.bounds.height / 2
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gin.cgColor
        textField.placeholder = text
    }
    
    private func setupLabels() {
        titleLabel.font = .appFont(.bold, size: .h20)
        emailTitleLabel.font = .appFont(.medium, size: .h14)
        passwordTitleLabel.font = .appFont(.medium, size: .h14)
    }
    
    deinit {
        print("Deinitialized \(String(describing: self))")
    }
    
    @IBAction private func loginButtonDidTap(_ sender: ActionButton) {
        output?.loginFinish()
    }
}
