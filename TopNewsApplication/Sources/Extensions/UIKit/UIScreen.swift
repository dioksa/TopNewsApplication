//
//  UIScreen.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 15.01.2025.
//

import UIKit

extension UIScreen {
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }

    static var isSmallScreen: Bool {
        return UIScreen.height < 700
    }
}
