//
//  CoordinatorProtocol.swift
//  TopNewsApp
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

enum CoordinatorType {
    case splash, login, home, favorites, profile
}

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationController: UINavigationController? { get set }
    var finishActionDelegate: CoordinatorFinishActionDelegate? { get set }
    
    func start()
    func finish()
}

protocol CoordinatorFinishActionDelegate: AnyObject {
    func coordinatorDidFinish(_ coordinator: CoordinatorProtocol)
}

// MARK: - CoordinatorProtocol
extension CoordinatorProtocol {
    func addChild(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    
    func removeChild(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
}
