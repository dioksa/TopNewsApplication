//
//  Coordinator.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

class Coordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol]
    var type: CoordinatorType
    var navigationController: UINavigationController?
    weak var finishActionDelegate: CoordinatorFinishActionDelegate?
    
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
        print("Deinitialized \(String(describing: self))")
        childCoordinators.forEach { $0.finishActionDelegate = nil }
        childCoordinators.removeAll()
    }
    
    func start() { }
    
    func finish() { }
}
