//
//  ExploreCell.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 10/03/2022.
//

import UIKit
import Lottie

class ExploreCell: UITableViewCell {
    static let reuseIdentifier = "ExploreCell"

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

    private var viewModel: ExploreCellViewModel?

    // MARK: - Inits

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: ExploreCellViewModel) {
        self.viewModel = viewModel
        guard let url = viewModel.url else { return }
        Animation.loadedFrom(url: url, closure: { [weak self] animation in
            guard let self = self else { return }
            self.lottieView.animation = animation
            self.lottieView.play()
        }, animationCache: LRUAnimationCache.sharedCache)
    }
}

extension ExploreCell {
    private func setupViews() {
        addSubview(topView)
        topView.addSubview(avatarImageView)
        topView.addSubview(nameLabel)
        addSubview(lottieView)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 70),
            
            avatarImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -15),
            nameLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
            lottieView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            lottieView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lottieView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lottieView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lottieView.heightAnchor.constraint(equalTo: lottieView.widthAnchor),
        ])
    }
}
