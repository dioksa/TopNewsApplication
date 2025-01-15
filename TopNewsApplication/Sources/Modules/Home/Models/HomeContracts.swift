//
//  HomeContracts.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 10.01.2025.
//

protocol HomeViewOutput: AnyObject {
    func viewIsReady()
}

protocol HomeViewInput: AnyObject {
    func configureText(title: String, address: String)
}
