//
//  QRDetailViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import UIKit
import Lottie

class QRDetailViewController: UIViewController {

    // MARK: - Outlets

    private lazy var animationView: AnimationView = {
        let view = AnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.loopMode = .loop
        view.backgroundBehavior = .pauseAndRestore
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var closeBarButtonItem: UIBarButtonItem = {
        let view = UIBarButtonItem(
            image: UIImage(systemName: "arrow.backward"),
            style: .plain,
            target: self,
            action: #selector(didTappedCloseButton))
        view.tintColor = .App.secondary
        return view
    }()

    
    private let viewModel: QRDetailViewModel

    // MARK: - Inits
    
    init(viewModel: QRDetailViewModel) {
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
        
        Animation.loadedFrom(url: viewModel.url, closure: { [weak self] animation in
            self?.animationView.animation = animation
            self?.animationView.play()
        }, animationCache: LRUAnimationCache.sharedCache)
    }
}

// MARK: - Actions

extension QRDetailViewController {
    @objc func didTappedCloseButton() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Private Methods

extension QRDetailViewController {
    private  func setupUI() {
        navigationItem.leftBarButtonItem = closeBarButtonItem
        view.backgroundColor = .white
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: view.topAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
