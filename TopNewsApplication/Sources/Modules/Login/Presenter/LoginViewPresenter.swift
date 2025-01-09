//
//  LoginViewPresenter.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

final class LoginViewPresenter: LoginViewControllerOutput {
    private weak var coordinator: LoginCoordinator?
    
    init(coordinator: LoginCoordinator?) {
        self.coordinator = coordinator
    }

    func loginFinish() {
        coordinator?.finish()
    }
}
