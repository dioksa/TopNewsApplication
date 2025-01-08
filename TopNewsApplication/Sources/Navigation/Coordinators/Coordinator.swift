//
//  Coordinator.swift
//  TopNewsApp
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

class Coordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol]
    var type: CoordinatorType
    var navigationController: UINavigationController?
    var finishActionDelegate: CoordinatorFinishActionDelegate?
    
    init(childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](),
         type: CoordinatorType,
         navigationController: UINavigationController?,
         finishActionDelegate: CoordinatorFinishActionDelegate? = nil) {
        self.childCoordinators = childCoordinators
        self.type = type
        self.navigationController = navigationController
        self.finishActionDelegate = finishActionDelegate
    }
    
    deinit {
        print("🌷 Coordinator \(type) deinit")
        childCoordinators.forEach { $0.finishActionDelegate = nil }
        childCoordinators.removeAll()
    }
    
    func start() {
        // Add action
    }
    
    func finish() {
        // Add action
    }
}
