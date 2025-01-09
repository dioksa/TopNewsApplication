//
//  MainCoordinator.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

final class MainCoordinator: Coordinator {
    private let factory = SceneFactory.self

    override func start() {
        showLoginScreen()
    }
    
    // MARK: - Private part
    private func showLoginScreen() {
        guard let navigationController = navigationController else { return }
        let loginCoordinator = LoginCoordinator(type: .login,
                                                navigationController: navigationController,
                                                finishActionDelegate: self)
        addChild(loginCoordinator)
        loginCoordinator.start()
    }
    
    private func showTabBarController() {
        let tabBarController = factory.makeTabBarController(coordinator: self,
                                                            finishActionDelegate: self)
        navigationController?.pushViewController(tabBarController, animated: true)
    }
}

// MARK: - CoordinatorFinishActionDelegate
extension MainCoordinator: CoordinatorFinishActionDelegate {
    func coordinatorDidFinish(_ coordinator: CoordinatorProtocol) {
        removeChild(coordinator)
        
        switch coordinator.type {
            case .login:
                showTabBarController()
                navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
            default:
                navigationController?.popToRootViewController(animated: true)
        }
    }
}
