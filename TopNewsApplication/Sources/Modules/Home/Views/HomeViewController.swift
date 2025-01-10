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

    var output: HomeViewControllerOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
        setupLabels()
        animateNewsImageView()
        setupBanner()
    }

    // MARK: - Private part
    private func setupLabels() {
        appNameLabel.font = .appFont(.bold, size: .h16)
        addressNameLabel.font = .appFont(.light, size: .h12)
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
