//
//  UIViewController.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 15.01.2025.
//

import UIKit

extension UIViewController {
    func hideKeyboardTappingAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
