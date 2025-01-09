//
//  ProfileCoordinator.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

final class ProfileCoordinator: Coordinator {

    override func start() {
        let splashViewController = LoginViewController()
        splashViewController.view.backgroundColor = .yellow
        navigationController?.pushViewController(splashViewController, animated: true)
    }
}
