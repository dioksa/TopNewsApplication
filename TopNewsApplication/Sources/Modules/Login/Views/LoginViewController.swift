//
//  LoginViewController.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

final class LoginViewController: UIViewController, Instantiatable {
    @IBOutlet private var loginButton: UIButton!
    
    var output: LoginViewControllerOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    deinit {
        print("Deinitialized \(String(describing: self))")
    }
    
    @IBAction private func loginButtonDidTap(_ sender: UIButton) {
        output?.loginFinish()
    }
}
