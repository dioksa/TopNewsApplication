//
//  NewsCollectionViewCell.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 10.01.2025.
//

import UIKit

final class NewsCollectionViewCell: UICollectionViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .red
    }

    func setup() { }
}
