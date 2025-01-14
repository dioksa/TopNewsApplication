//
//  HomeViewController.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

import UIKit

final class HomeViewController: UIViewController, Instantiatable {
    private enum Constants {
        static let backAnimationDuration = 4.0
        static let newsCellIdentifier = "NewsCollectionViewCell"
        static let logoScaleValue = 1.2
        static let collectionItemSpacing = 16.0
        static let minimumLineSpacing = 8.0
        static let bannerAnimationDuration = 1.5
        static let numberOfRowsInCollection: CGFloat = 2
    }
    
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var appNameLabel: UILabel!
    @IBOutlet private var addressNameLabel: UILabel!
    @IBOutlet private var newsLogoImageView: UIImageView!
    @IBOutlet private var collectionView: UICollectionView!
    
    var output: HomeViewControllerOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
        setupLabels()
        animateNewsImageView()
        setupBanner()
        registerCells()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let lastItem = collectionView.numberOfItems(inSection: 0) - 1
        let lastIndexPath = IndexPath(item: lastItem, section: 0)
        collectionView.scrollToItem(at: lastIndexPath, at: .right, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.backAnimationDuration) {
            let firstIndexPath = IndexPath(item: 0, section: 0)
            self.collectionView.scrollToItem(at: firstIndexPath, at: .left, animated: true)
        }
    }
    
    // MARK: - Private part
    private func setupLabels() {
        appNameLabel.font = .appFont(.bold, size: .h16)
        addressNameLabel.font = .appFont(.light, size: .h12)
    }
    
    private func registerCells() {
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: Constants.newsCellIdentifier)
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    private func animateNewsImageView() {
        UIView.animate(withDuration: Constants.bannerAnimationDuration,
                       delay: 0,
                       options: [.autoreverse, .repeat],
                       animations: {
            self.newsLogoImageView.transform = CGAffineTransform(scaleX: Constants.logoScaleValue,
                                                                 y: Constants.logoScaleValue)
        }, completion: nil)
    }
    
    private func setupBanner() {
        let bannerVC = BannerViewController()
        addChild(bannerVC)
        containerView.addSubview(bannerVC.view)
        
        bannerVC.view.frame = containerView.bounds
        bannerVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        bannerVC.didMove(toParent: self)
    }
}

// MARK: - LoginViewInput
extension HomeViewController: LoginViewInput {
    func configureText(title: String, address: String) {
        appNameLabel.text = title
        addressNameLabel.text = address
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Temporary data
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.newsCellIdentifier, for: indexPath) as? NewsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setup()
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: calculateWidth(), height: calculateHeight())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.collectionItemSpacing,
                            left: Constants.collectionItemSpacing,
                            bottom: Constants.collectionItemSpacing,
                            right: Constants.collectionItemSpacing)
    }
    
    private func calculateWidth() -> CGFloat {
        (collectionView.frame.width) / Constants.numberOfRowsInCollection
    }
    
    private func calculateHeight() -> CGFloat {
        let offsets: CGFloat = Constants.collectionItemSpacing * 3
        return (collectionView.frame.height - offsets) / Constants.numberOfRowsInCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.minimumLineSpacing
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: - Handle tap action
    }
}
