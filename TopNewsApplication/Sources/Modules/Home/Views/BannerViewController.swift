//
//  BannerViewController.swift
//  TopNewsApplication
//
//  Created by Oksana Dionisieva on 09.01.2025.
//

import UIKit

final class BannerViewController: UIViewController {
    private enum Constants {
        static let bannerTimeInterval: TimeInterval = 3.0
        static let bannerHeight: CGFloat = 180.0
        static let bannerCornerRadius: CGFloat = 16.0
        static let shadowOpacity: Float = 0.3
        static let shadowOffsetHeight = 10.0
        static let shadowRadius: CGFloat = 20.0
        static let pageControlTopSpace: CGFloat = 8.0
    }
    
    private var pageViewController: UIPageViewController!
    private var banners: [UIViewController] = []
    private var pageControl: UIPageControl!
    private var currentIndex = 0
    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
        setupPageControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAutoScroll()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }

    // MARK: - Private part
    private func setupPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                  navigationOrientation: .horizontal,
                                                  options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self

        banners = [
            createBanner(image: UIImage(resource: .banner1)),
            createBanner(image: UIImage(resource: .banner2)),
            createBanner(image: UIImage(resource: .banner3))
        ]

        pageViewController.setViewControllers([banners.first!], direction: .forward, animated: true, completion: nil)

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)

        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.heightAnchor.constraint(equalToConstant: Constants.bannerHeight)
        ])
        
        pageViewController.view.layer.cornerRadius = Constants.bannerCornerRadius
        pageViewController.view.layer.masksToBounds = true

        pageViewController.view.superview?.layer.shadowColor = UIColor.black.cgColor
        pageViewController.view.superview?.layer.shadowOpacity = Constants.shadowOpacity
        pageViewController.view.superview?.layer.shadowOffset = CGSize(width: 0, height: Constants.shadowOffsetHeight)
        pageViewController.view.superview?.layer.shadowRadius = Constants.shadowRadius
    }

    private func setupPageControl() {
        pageControl = UIPageControl()
        pageControl.numberOfPages = banners.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .eucalyptus
        pageControl.pageIndicatorTintColor = .gin

        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: pageViewController.view.bottomAnchor,
                                             constant: Constants.pageControlTopSpace),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func createBanner(image: UIImage?) -> UIViewController {
        let banner = UIViewController()
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        banner.view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: banner.view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: banner.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: banner.view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: banner.view.bottomAnchor)
        ])
        
        return banner
    }

    private func startAutoScroll() {
        timer = Timer.scheduledTimer(timeInterval: Constants.bannerTimeInterval, target: self, selector: #selector(scrollToNextPage), userInfo: nil, repeats: true)
    }

    @objc private func scrollToNextPage() {
        guard banners.count > 1 else { return }

        let nextIndex = (currentIndex + 1) % banners.count
        let direction: UIPageViewController.NavigationDirection = nextIndex > currentIndex ? .forward : .reverse

        pageViewController.setViewControllers([banners[nextIndex]], direction: direction, animated: true, completion: nil)
        currentIndex = nextIndex
        pageControl.currentPage = currentIndex
    }
}

// MARK: - UIPageViewControllerDataSource
extension BannerViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = banners.firstIndex(of: viewController), index > 0 else { return nil }
        return banners[index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = banners.firstIndex(of: viewController), index < banners.count - 1 else { return nil }
        return banners[index + 1]
    }
}

// MARK: - UIPageViewControllerDelegate
extension BannerViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let visibleViewController = pageViewController.viewControllers?.first,
           let index = banners.firstIndex(of: visibleViewController) {
            currentIndex = index
            pageControl.currentPage = currentIndex
        }
    }
}
