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
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    var output: LoginViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true

        hideKeyboardTappingAround()
        addedKeyboardObservers()

        configureLoginButton()
        setupLabels()

        configureTextField(with: "Please enter your email", for: emailTextField)
        configureTextField(with: "Please enter your password", for: passwordTextField)
        
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
    
    private func configureLoginButton() {
        loginButton.isAnimated = true
        loginButton.setTitle("Sign in", for: .normal)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("Deinitialized \(String(describing: self))")
    }
    
    @IBAction private func loginButtonDidTap(_ sender: ActionButton) {
        output?.loginFinish()
    }
}

// MARK: - LoginViewInput
extension LoginViewController: LoginViewInput {
    func startAnimating() {
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }
}

// MARK: - Keyboard observers
private extension LoginViewController {
    func addedKeyboardObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? CGRect.zero
        let keyboardHeight = keyboardFrame.height

        if UIScreen.isSmallScreen {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.frame.origin.y = -keyboardHeight
            }
        }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        if UIScreen.isSmallScreen {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.frame.origin.y = 0
            }
        }
    }
}
