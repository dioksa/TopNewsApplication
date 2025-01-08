//
//  HomeCoordinator.swift
//  TopNewsApp
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

final class HomeCoordinator: Coordinator {

    override func start() {
        let splashViewController = ViewController()
        splashViewController.view.backgroundColor = .green
        navigationController?.pushViewController(splashViewController, animated: true)
    }
}
