//
//  MainCoordinator.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

final class MainCoordinator: Coordinator {
    override func start() {
        showLoginScreen()
    }
    
    private func showLoginScreen() {
        guard let navigationController = navigationController else { return }
        let loginCoordinator = LoginCoordinator(type: .login, navigationController: navigationController, finishActionDelegate: self)
        addChild(loginCoordinator)
        loginCoordinator.start()
    }
    
    private func loadTabBarItems() {
        guard let navigationController else { return }

        let homeNavigationVC = UINavigationController()
        homeNavigationVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeIcon"), tag: 0)
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationVC, finishActionDelegate: self)
        homeCoordinator.start()
        addChild(homeCoordinator)
        
        let favoritesNavigationVC = UINavigationController()
        favoritesNavigationVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favoriteIcon"), tag: 1)
        let favoritesCoordinator = FavoritesCoordinator(type: .favorites, navigationController: favoritesNavigationVC, finishActionDelegate: self)
        favoritesCoordinator.start()
        addChild(favoritesCoordinator)
        
        let profileNavigationVC = UINavigationController()
        profileNavigationVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileIcon"), tag: 2)
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationVC, finishActionDelegate: self)
        profileCoordinator.start()
        addChild(profileCoordinator)
        
        let tabBarControllers = [homeNavigationVC, favoritesNavigationVC, profileNavigationVC]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        tabBarController.navigationItem.hidesBackButton = true
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

// MARK: - CoordinatorFinishActionDelegate
extension MainCoordinator: CoordinatorFinishActionDelegate {
    func coordinatorDidFinish(_ coordinator: CoordinatorProtocol) {
        removeChild(coordinator)
        
        switch coordinator.type {
            case .login:
                loadTabBarItems()
                navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
            default:
                navigationController?.popToRootViewController(animated: true)
        }
    }
}
