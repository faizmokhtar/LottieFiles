//
//  HomeFeaturedCell.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import UIKit
import Lottie

class HomeFeaturedCell: UICollectionViewCell {
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.dropShadow()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var lottieView: AnimationView = {
        let view = AnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundBehavior = .pauseAndRestore
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        return view
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 15, weight: .medium)
        view.textColor = .label
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var authorLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textColor = .secondaryLabel
        return view
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeFeaturedCell: SelfConfiguringCell {
    static var reuseIdentifier: String {
        return "HomeFeaturedCell"
    }
    
    func configure(with item: HomeItem) {
        lottieView.backgroundColor = item.backgroundColor
        self.titleLabel.text = item.name
        self.authorLabel.text = item.authorName
        guard let lottieURL = item.animationURL else { return }
        Animation.loadedFrom(url: lottieURL, closure: { [weak self] animation in
            self?.lottieView.animation = animation
            self?.lottieView.play()
        }, animationCache: LRUAnimationCache.sharedCache)
    }
}

extension HomeFeaturedCell {
    private func setupViews() {
        addSubviews([
            cardView,
        ])
        cardView.addSubviews([
            lottieView,
            bottomView,
        ])
        bottomView.addSubviews([
            titleLabel,
            authorLabel
        ])
                
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lottieView.topAnchor.constraint(equalTo: cardView.topAnchor),
            lottieView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            lottieView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            lottieView.heightAnchor.constraint(equalToConstant: 310),
            
            bottomView.topAnchor.constraint(equalTo: lottieView.bottomAnchor, constant: 16),
            bottomView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            bottomView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            bottomView.bottomAnchor.constraint(lessThanOrEqualTo: cardView.bottomAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: bottomView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            authorLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor)
        ])
    }
}
