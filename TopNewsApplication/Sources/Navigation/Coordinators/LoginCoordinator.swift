//
//  LoginCoordinator.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

final class LoginCoordinator: Coordinator {
    private let factory = SceneFactory.self

    override func start() {
        guard let navigationController = navigationController else { return }
        let loginScreen = factory.makeLoginScreen(coordinator: self)
        navigationController.pushViewController(loginScreen, animated: true)
    }
    
    override func finish() {
        finishActionDelegate?.coordinatorDidFinish(self)
    }
    
    deinit {
        print("LoginCoordinator deinit")
    }
}
