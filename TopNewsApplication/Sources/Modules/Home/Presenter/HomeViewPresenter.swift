//
//  HomeViewPresenter.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

final class HomeViewPresenter {
    private weak var coordinator: HomeCoordinator?
    private weak var view: HomeViewInput?
    
    init(coordinator: HomeCoordinator?, view: HomeViewInput?) {
        self.coordinator = coordinator
        self.view = view
    }
}

// MARK: - HomeViewControllerOutput
extension HomeViewPresenter: HomeViewOutput {
    func viewIsReady() {
        view?.configureText(title: .Home.Header.title,
                            address: .Home.Header.address)
    }
}
