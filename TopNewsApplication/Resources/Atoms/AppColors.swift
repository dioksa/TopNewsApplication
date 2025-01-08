//
//  AppColors.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

/*
 To find the approximate name for the color the following resource shall be used:
 http://chir.ag/projects/name-that-color/
 */

extension UIColor {
    /// #248641 - rgb(36 134 65)
    static let eucalyptus = #colorLiteral(red: 0.1411764706, green: 0.5254901961, blue: 0.2549019608, alpha: 1)
    /// #E9F3EC - rgb(233 243 236)
    static let gin = #colorLiteral(red: 0.9137254902, green: 0.9529411765, blue: 0.9254901961, alpha: 1)

    private static func color(named: String) -> UIColor {
        return UIColor(named: named)! // We should have a crash with wrong color
    }
}
