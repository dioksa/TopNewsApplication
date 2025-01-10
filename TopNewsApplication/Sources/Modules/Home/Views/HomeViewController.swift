//
//  HomeViewController.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

import UIKit

final class HomeViewController: UIViewController, Instantiatable {
    @IBOutlet private var containerView: UIView!
    
    var output: HomeViewControllerOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBanner()
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
