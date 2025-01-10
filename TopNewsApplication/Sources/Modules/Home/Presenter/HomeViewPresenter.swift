//
//  HomeViewPresenter.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

protocol HomeViewControllerOutput: AnyObject {}

final class HomeViewPresenter: HomeViewControllerOutput {
    private weak var coordinator: HomeCoordinator?
    
    init(coordinator: HomeCoordinator?) {
        self.coordinator = coordinator
    }
}
