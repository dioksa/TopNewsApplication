//
//  SplashCoordinator.swift
//  TopNewsApp
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

final class SplashCoordinator: Coordinator {

    override func start() {
        let splashViewController = ViewController()
        navigationController?.pushViewController(splashViewController, animated: true)
    }
}
