//
//  SceneFactory.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

import UIKit

struct SceneFactory {
    static func makeLoginScreen(coordinator: LoginCoordinator) -> LoginViewController {
        let presenter = LoginViewPresenter(coordinator: coordinator)
        let loginViewController = UIStoryboard(name: "LoginViewController", bundle: nil).instantiate() as LoginViewController
        loginViewController.output = presenter
        
        return loginViewController
    }
}
