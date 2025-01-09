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
        let loginScreen = factory.makeLoginController(coordinator: self)
        navigationController.pushViewController(loginScreen, animated: true)
    }
    
    override func finish() {
        finishActionDelegate?.coordinatorDidFinish(self)
    }
    
    deinit {
        print("Deinitialized \(String(describing: self))")
    }
}
