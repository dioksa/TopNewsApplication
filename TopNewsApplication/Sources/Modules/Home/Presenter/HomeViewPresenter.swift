//
//  HomeViewPresenter.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

final class HomeViewPresenter {
    private weak var coordinator: HomeCoordinator?
    private weak var view: LoginViewInput?
    
    init(coordinator: HomeCoordinator?, view: LoginViewInput?) {
        self.coordinator = coordinator
        self.view = view
    }
}

// MARK: - HomeViewControllerOutput
extension HomeViewPresenter: HomeViewControllerOutput {
    func viewIsReady() {
        view?.configureText(title: .Home.Header.title,
                            address: .Home.Header.address)
    }
}
