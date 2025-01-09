//
//  Instantiatable.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

protocol Instantiatable: AnyObject {
    static var identifier: String { get }
}

extension Instantiatable {
    static var identifier: String {
        String(describing: self)
    }
}
