//
//  TabBarController.swift
//  TopNewsApp
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

final class TabBarController: UITabBarController {
    
    init(tabBarControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)

        for tabBar in tabBarControllers {
            self.addChild(tabBar)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .gin
        tabBar.tintColor = .eucalyptus
    }
}
