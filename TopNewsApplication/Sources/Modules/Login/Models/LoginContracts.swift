//
//  LoginContracts.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

protocol LoginViewOutput: AnyObject {
    func loginFinish()
}

protocol LoginViewInput: AnyObject {
    func startAnimating()
    func stopAnimating()
}
