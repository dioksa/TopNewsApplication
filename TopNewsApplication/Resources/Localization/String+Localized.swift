//
//  String+Localized.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 10.01.2025.
//

import Foundation

func localized(_ key: String, _ comment: String = "") -> String {
    return NSLocalizedString(key, comment: comment)
}

extension String {
    enum Home {
        enum Header {
            static let title = localized("home_page_app_name")
            static let address = localized("home_page_address_name")
        }
    }
}
