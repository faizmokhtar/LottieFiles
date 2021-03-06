//
//  ExploreViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import UIKit
import LZViewPager

class ExploreViewController: UIViewController {

    enum Pages: Int, CaseIterable {
        case recent
        case featured
        case popular
    }

    lazy var viewPager: LZViewPager = {
        let view = LZViewPager()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let viewModel: ExploreViewModel
    
    // MARK: - Inits

    init(viewModel: ExploreViewModel = ExploreViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewPager.dataSource = self
        viewPager.hostController = self
        viewPager.reload()
    }
}

// MARK: - Private Methods

extension ExploreViewController {
    private func setupUI() {
        view.addSubview(viewPager)

        NSLayoutConstraint.activate([
            viewPager.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewPager.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewPager.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewPager.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - LZViewPager Data Source

extension ExploreViewController: LZViewPagerDataSource {
    func numberOfItems() -> Int {
        return Pages.allCases.count
    }
    
    func controller(at index: Int) -> UIViewController {
        guard let page = Pages(rawValue: index) else { return UIViewController() }
        switch page {
        case .recent:
            let viewModel = AnimationListViewModel(type: .recent)
            return AnimationListViewController(viewModel: viewModel)
        case .featured:
            let viewModel = AnimationListViewModel(type: .featured)
            return AnimationListViewController(viewModel: viewModel)
        case .popular:
            let viewModel = AnimationListViewModel(type: .popular)
            return AnimationListViewController(viewModel: viewModel)
        }
    }
    
    func button(at index: Int) -> UIButton {
        guard let page = Pages(rawValue: index) else { return UIButton() }
        let button = UIButton()
        button.setTitleColor(.label, for: .selected)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        switch page {
        case .recent:
            button.setTitle("Recent", for: .normal)
        case .featured:
            button.setTitle("Featured", for: .normal)
        case .popular:
            button.setTitle("Popular", for: .normal)
        }
        return button
    }
    
    func heightForIndicator() -> CGFloat {
        return 4.0
    }

    func colorForIndicator(at index: Int) -> UIColor {
        return UIColor.App.primary!
    }
    
    
}
