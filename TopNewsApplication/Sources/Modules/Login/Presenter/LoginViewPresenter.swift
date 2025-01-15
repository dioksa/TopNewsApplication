//
//  LoginViewPresenter.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

import Foundation

final class LoginViewPresenter: LoginViewOutput {
    private weak var coordinator: LoginCoordinator?
    private weak var view: LoginViewInput?
    
    init(coordinator: LoginCoordinator?, view: LoginViewInput?) {
        self.coordinator = coordinator
        self.view = view
    }

    func loginFinish() {
        view?.startAnimating()
        
        // Temporary code
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [weak self] in
            self?.view?.stopAnimating()
            self?.coordinator?.finish()
        })
    }
}
