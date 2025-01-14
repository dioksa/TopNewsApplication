//
//  FavoritesCoordinator.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

final class FavoritesCoordinator: Coordinator {

    override func start() {
        let splashViewController = UIViewController()
        splashViewController.view.backgroundColor = .blue
        navigationController?.pushViewController(splashViewController, animated: true)
    }
}
