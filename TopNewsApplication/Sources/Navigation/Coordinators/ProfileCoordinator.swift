//
//  ProfileCoordinator.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

final class ProfileCoordinator: Coordinator {

    override func start() {
        let splashViewController = UIViewController()
        splashViewController.view.backgroundColor = .yellow
        navigationController?.pushViewController(splashViewController, animated: true)
    }
}
