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
        view.loopMode = .loop
        return view
    }()
    
    private lazy var playerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var playButton: UIButton = {
        let view = UIButton(type: .custom)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        view.addTarget(self, action: #selector(didTappedPlayButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var slider: UISlider = {
        let view = UISlider()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let viewModel: AnimationViewModel

    // MARK: - Inits
    
    init(viewModel: AnimationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        guard let url = viewModel.lottieURL else { return }
        animationView.loadFromUrl(url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        animationView.backgroundColor = viewModel.backgroundColor
    }
    
    @objc func didTappedPlayButton() {
        if animationView.isAnimationPlaying {
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            animationView.pause()
        } else {
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            animationView.play()
        }
    }
}

extension AnimationDetailViewController {
    private func setupUI() {
        view.addSubviews([
            animationView,
            playerView
        ])
        
        playerView.addSubviews([
            playButton,
            slider
        ])
        
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: animationView.widthAnchor),
            
            playerView.topAnchor.constraint(equalTo: animationView.bottomAnchor),
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            playButton.topAnchor.constraint(equalTo: playerView.topAnchor, constant: 10),
            playButton.leadingAnchor.constraint(equalTo: playerView.leadingAnchor, constant: 15),
            playButton.bottomAnchor.constraint(equalTo: playerView.bottomAnchor, constant: -10),
            playButton.heightAnchor.constraint(equalToConstant: 44),
            playButton.widthAnchor.constraint(equalTo: playButton.heightAnchor),
            
            slider.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 10),
            slider.trailingAnchor.constraint(equalTo: playerView.trailingAnchor, constant: -15),
            slider.centerYAnchor.constraint(equalTo: playerView.centerYAnchor)
        ])
    }
}

