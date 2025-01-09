//
//  UIStoryboard.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

import UIKit

extension UIStoryboard {
    func instantiate<T: UIViewController>(_ viewControllerType: T.Type = T.self) -> T where T: Instantiatable {
        let identifier = T.identifier
        guard let viewController = instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("\(identifier) cannot be instantiated")
        }
        return viewController
    }
}
