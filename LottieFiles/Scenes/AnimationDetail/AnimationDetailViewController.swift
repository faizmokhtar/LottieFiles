//
//  AnimationDetailViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 14/03/2022.
//

import UIKit
import Lottie

class AnimationDetailViewController: UIViewController {

    private lazy var animationView: AnimationView = {
        let view = AnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundBehavior = .pauseAndRestore
        view.backgroundColor = .blue
        return view
    }()
    
    private let viewModel: AnimationDetailViewModel

    // MARK: - Inits
    
    init(viewModel: AnimationDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        animationView.loadFromUrl(viewModel.lottieURL)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
}

extension AnimationDetailViewController {
    private func setupUI() {
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: animationView.widthAnchor)
        ])
    }
}

