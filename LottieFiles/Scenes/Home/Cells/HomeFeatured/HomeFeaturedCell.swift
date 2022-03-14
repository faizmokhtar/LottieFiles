//
//  HomeFeaturedCell.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import UIKit

class HomeFeaturedCell: UICollectionViewCell {
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    let lottieView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Label"
        return view
    }()
    
    let authorLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "faiz mokhtar"
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
        
    }
}

extension HomeFeaturedCell {
    private func setupViews() {
        contentView.addSubview(cardView)
        cardView.addSubviews([
            lottieView,
            titleLabel,
            authorLabel
        ])
                
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            lottieView.topAnchor.constraint(equalTo: cardView.topAnchor),
            lottieView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            lottieView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: lottieView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            authorLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
        ])
    }
}
