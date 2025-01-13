//
//  HomeViewController.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

import UIKit

final class HomeViewController: UIViewController, Instantiatable {
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
        collectionView.reloadData()
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.layoutIfNeeded()
    }
        
    // MARK: - Private part
    private func setupLabels() {
        appNameLabel.font = .appFont(.bold, size: .h16)
        addressNameLabel.font = .appFont(.light, size: .h12)
    }
    
    private func registerCells() {
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: "NewsCollectionViewCell")
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    private func animateNewsImageView() {
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       options: [.autoreverse, .repeat],
                       animations: {
                           self.newsLogoImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
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
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell else {
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
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

    private func calculateWidth() -> CGFloat {
        let numberRows: CGFloat = 2
        return (collectionView.frame.width) / numberRows
    }
    
    private func calculateHeight() -> CGFloat {
        let offsets: CGFloat = 16 * 3
        let numberRows: CGFloat = 2

        return (collectionView.frame.height - offsets) / numberRows
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        presenter?.createProductDetails(indexPath)
    }
}
