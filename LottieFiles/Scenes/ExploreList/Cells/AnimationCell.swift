//
//  AnimationCell.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 10/03/2022.
//

import UIKit
import Lottie
import SDWebImage

class AnimationCell: UITableViewCell {
    static let reuseIdentifier = "AnimationCell"

    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var avatarImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Animation name goes here"
        view.font = .systemFont(ofSize: 14, weight: .medium)
        view.numberOfLines = 0
        view.textAlignment = .left
        return view
    }()
    
    lazy var usernameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Username goes here"
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textColor = .secondaryLabel
        view.numberOfLines = 0
        view.textAlignment = .left
        return view
    }()
    
    lazy var loadingIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .App.primary
        view.hidesWhenStopped = true
        return view
    }()

    lazy var lottieView: AnimationView = {
        let view = AnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.loopMode = .loop
        view.backgroundBehavior = .pauseAndRestore
        view.contentMode = .scaleAspectFit
        return view
    }()

    private var viewModel: AnimationViewModel?

    // MARK: - Inits

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: AnimationViewModel) {
        self.viewModel = viewModel
        self.nameLabel.text = viewModel.name
        self.usernameLabel.text = viewModel.username
        self.avatarImageView.sd_setImage(with: viewModel.avatarURL, placeholderImage: UIImage(named: ""))
        self.lottieView.backgroundColor = viewModel.backgroundColor
        loadingIndicatorView.startAnimating()
        guard let url = viewModel.lottieURL else { return }
        Animation.loadedFrom(url: url, closure: { [weak self] animation in
            self?.lottieView.animation = animation
            self?.lottieView.play()
            self?.loadingIndicatorView.stopAnimating()
        }, animationCache: LRUAnimationCache.sharedCache)
    }
}

// MARK: - Private Methods

extension AnimationCell {
    private func setupViews() {
        selectionStyle = .none
        addSubviews([
            topView,
            lottieView
        ])
        
        avatarImageView.addSubview(loadingIndicatorView)
        
        topView.addSubviews([
            avatarImageView,
            nameLabel,
            usernameLabel
        ])
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 70),
            
            avatarImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
            loadingIndicatorView.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            loadingIndicatorView.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),

            nameLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -15),
            
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            usernameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            usernameLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -5),
            
            lottieView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            lottieView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lottieView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lottieView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lottieView.heightAnchor.constraint(equalTo: lottieView.widthAnchor),
        ])
    }
    
    private func loadLottie(url: URL?) {
        guard let url = url else { return }
        Animation.loadedFrom(url: url, closure: { [weak self] animation in
            guard let self = self else { return }
            self.lottieView.animation = animation
            self.lottieView.play()
        }, animationCache: LRUAnimationCache.sharedCache)
    }
}
