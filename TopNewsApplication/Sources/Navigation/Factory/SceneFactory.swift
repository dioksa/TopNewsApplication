//
//  SceneFactory.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

import UIKit

struct SceneFactory {
    // MARK: - Coordinators
    static func makeLoginCoordinator(coordinator: MainCoordinator,
                                     finishActionDelegate: CoordinatorFinishActionDelegate,
                                     navigationController: UINavigationController) -> LoginCoordinator {
        let loginCoordinator = LoginCoordinator(type: .login, navigationController: navigationController, finishActionDelegate: finishActionDelegate)
        coordinator.addChild(loginCoordinator)
        return loginCoordinator
    }
    
    // MARK: - Controllers
    static func makeTabBarController(coordinator: MainCoordinator,
                                     finishActionDelegate: CoordinatorFinishActionDelegate) -> TabBarController {

        let homeNavigationVC = UINavigationController()
        homeNavigationVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(resource: .homeIcon), tag: 0)
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationVC, finishActionDelegate: finishActionDelegate)
        homeCoordinator.start()
        coordinator.addChild(homeCoordinator)
        
        let favoritesNavigationVC = UINavigationController()
        favoritesNavigationVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(resource: .favoriteIcon), tag: 1)
        let favoritesCoordinator = FavoritesCoordinator(type: .favorites, navigationController: favoritesNavigationVC, finishActionDelegate: finishActionDelegate)
        favoritesCoordinator.start()
        coordinator.addChild(favoritesCoordinator)
        
        let profileNavigationVC = UINavigationController()
        profileNavigationVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(resource: .profileIcon), tag: 2)
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationVC, finishActionDelegate: finishActionDelegate)
        profileCoordinator.start()
        coordinator.addChild(profileCoordinator)
        
        let tabBarControllers = [homeNavigationVC, favoritesNavigationVC, profileNavigationVC]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        tabBarController.navigationItem.hidesBackButton = true
        
        return tabBarController
    }

    static func makeLoginController(coordinator: LoginCoordinator) -> LoginViewController {
        let presenter = LoginViewPresenter(coordinator: coordinator)
        let loginViewController = UIStoryboard(name: "LoginViewController", bundle: nil).instantiate() as LoginViewController
        loginViewController.output = presenter
        
        return loginViewController
    }
    
    static func makeHomeController(coordinator: HomeCoordinator) -> HomeViewController {
        let presenter = HomeViewPresenter(coordinator: coordinator)
        let homeViewController = UIStoryboard(name: "HomeViewController", bundle: nil).instantiate() as HomeViewController
        
        return homeViewController
    }

}
