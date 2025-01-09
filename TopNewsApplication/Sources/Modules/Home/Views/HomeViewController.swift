//
//  HomeViewController.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

import UIKit

final class HomeViewController: UIViewController, Instantiatable {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    deinit {
        print("Deinitialized \(String(describing: self))")
    }
}
