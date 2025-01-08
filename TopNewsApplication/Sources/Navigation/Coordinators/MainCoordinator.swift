//
//  MainCoordinator.swift
//  TopNewsApp
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

final class MainCoordinator: Coordinator {
    override func start() {
        showSplashScreen()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.showTabBarItems()
        }
    }
    
    private func showSplashScreen() {
        guard let navigationController = navigationController else { return }
        let splashCoordinator = SplashCoordinator(type: .splash, navigationController: navigationController, finishActionDelegate: self)
        addChild(splashCoordinator)
        splashCoordinator.start()
    }
    
    private func showTabBarItems() {
        guard let navigationController else { return }

        let homeNavigationVC = UINavigationController()
        homeNavigationVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationVC, finishActionDelegate: self)
        homeCoordinator.start()
        addChild(homeCoordinator)
        
        let favoritesNavigationVC = UINavigationController()
        favoritesNavigationVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "house"), tag: 0)
        let favoritesCoordinator = FavoritesCoordinator(type: .favorites, navigationController: favoritesNavigationVC, finishActionDelegate: self)
        favoritesCoordinator.start()
        addChild(favoritesCoordinator)
        
        let profileNavigationVC = UINavigationController()
        profileNavigationVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "house"), tag: 0)
        let profileCoordinator = HomeCoordinator(type: .profile, navigationController: profileNavigationVC, finishActionDelegate: self)
        profileCoordinator.start()
        addChild(profileCoordinator)
        
        let tabBarControllers = [homeNavigationVC, favoritesNavigationVC, profileNavigationVC]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

// MARK: - CoordinatorFinishActionDelegate
extension MainCoordinator: CoordinatorFinishActionDelegate {
    func coordinatorDidFinish(_ coordinator: CoordinatorProtocol) {
        removeChild(coordinator)
        
        switch coordinator.type {
            case .login:
                return
            default:
                navigationController?.popToRootViewController(animated: true)
        }
    }
}
