//
//  AnimationDetailViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 14/03/2022.
//

import UIKit
import Lottie

class AnimationDetailViewController: UIViewController {

    // MARK: - Outlets

    private lazy var animationView: AnimationView = {
        let view = AnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundBehavior = .pauseAndRestore
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
        view.tintColor = .App.secondary
        view.addTarget(self, action: #selector(didTappedPlayButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var slider: UISlider = {
        let view = UISlider()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .App.primary
        return view
    }()
    
    private lazy var displayLink: CADisplayLink = {
        let link = CADisplayLink(target: self, selector: #selector(didRefreshDisplay))
        return link
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
    
    private lazy var shareBarButtonItem: UIBarButtonItem = {
        let view = UIBarButtonItem(
            image: UIImage(systemName: "square.and.arrow.up.fill"),
            style: .plain,
            target: self,
            action: #selector(didTappedShareButton))
        view.tintColor = .App.secondary
        return view
    }()

    private let viewModel: AnimationViewModel

    // MARK: - Inits
    
    init(viewModel: AnimationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        guard let url = viewModel.lottieURL else { return }
        Animation.loadedFrom(url: url, closure: { [weak self] animation in
            self?.slider.minimumValue = Float(animation?.startFrame ?? 0)
            self?.slider.maximumValue = Float(animation?.endFrame ?? 0)
            self?.animationView.animation = animation
            self?.animationView.play()
        }, animationCache: LRUAnimationCache.sharedCache)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        displayLink.add(to: .current, forMode: RunLoop.Mode.default)
        setupUI()
        animationView.backgroundColor = viewModel.backgroundColor
    }
}

// MARK: -  Actions

extension AnimationDetailViewController {
    @objc func didTappedPlayButton() {
        if animationView.isAnimationPlaying {
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            animationView.pause()
        } else {
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            animationView.play()
        }
    }
    
    @objc func didRefreshDisplay() {
        guard animationView.isAnimationPlaying else { return }
        let currentFrame = Float(animationView.realtimeAnimationFrame)
        slider.setValue(currentFrame, animated: true)
    }
    
    @objc func didTappedShareButton() {
        let viewController = AnimationShareViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .pageSheet
        if let sheet = navigationController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc func didTappedCloseButton() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Privates

extension AnimationDetailViewController {
    private func setupUI() {
        navigationItem.leftBarButtonItem = closeBarButtonItem
        navigationItem.rightBarButtonItem = shareBarButtonItem
        
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

