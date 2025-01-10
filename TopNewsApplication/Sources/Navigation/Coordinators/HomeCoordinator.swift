//
//  HomeCoordinator.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

final class HomeCoordinator: Coordinator {
    private let factory = SceneFactory.self

    override func start() {
        guard let navigationController = navigationController else { return }
        let homeScreen = factory.makeHomeController(coordinator: self)
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(homeScreen, animated: true)
    }
}
