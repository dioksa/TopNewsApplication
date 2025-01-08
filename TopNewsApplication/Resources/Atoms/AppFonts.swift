//
//  AppFonts.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 08.01.2025.
//

import UIKit

extension UIFont {
    static func appFont(_ style: Font.Style, size: Font.Size) -> UIFont {
        switch style {
        case .light:
            return getFont(by: .light, ofSize: size)
        case .regular:
            return getFont(by: .regular, ofSize: size)
        case .medium:
            return getFont(by: .medium, ofSize: size)
        case .bold:
            return getFont(by: .bold, ofSize: size)
        }
    }

    private static func getFont(by name: Font.Name, ofSize fontSize: Font.Size) -> UIFont {
        guard let font = UIFont(name: name.rawValue, size: fontSize.rawValue) else {
            fatalError("Font is not installed. Please add it to Font.Size")
        }

        return font
    }
}

enum Font {
    enum Style: String {
        case light
        case regular
        case medium
        case bold
    }

    enum Size: CGFloat {
        case h10 = 10.0
        case h12 = 12.0
        case h16 = 16.0
    }

    enum Name: String {
        case light = "Roboto-Light"
        case regular = "Roboto-Regular"
        case medium = "Roboto-Medium"
        case bold = "Roboto-Bold"
    }
}
