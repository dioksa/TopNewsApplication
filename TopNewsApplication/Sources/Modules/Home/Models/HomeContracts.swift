//
//  HomeContracts.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 10.01.2025.
//

protocol HomeViewControllerOutput: AnyObject {
    func viewIsReady()
}

protocol LoginViewInput: AnyObject {
    func configureText(title: String, address: String)
}
