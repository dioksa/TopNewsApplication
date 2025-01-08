//
//  ProfileCoordinator.swift
//  TopNewsApp
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

final class ProfileCoordinator: Coordinator {

    override func start() {
        let splashViewController = ViewController()
        splashViewController.view.backgroundColor = .yellow
        navigationController?.pushViewController(splashViewController, animated: true)
    }
}
