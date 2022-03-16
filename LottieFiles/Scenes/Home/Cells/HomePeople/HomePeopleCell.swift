//
//  HomePeopleCell.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import UIKit

class HomePeopleCell: UICollectionViewCell {

    private let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.dropShadow()
        return view
    }()

    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.font = .systemFont(ofSize: 16, weight: .medium)
        view.textColor = .label
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

extension HomePeopleCell: SelfConfiguringCell {
    static var reuseIdentifier: String {
        return "HomePeopleCell"
    }
    
    func configure(with item: HomeItem) {
        self.nameLabel.text = item.avatarName
        self.imageView.sd_setImage(with: item.avatarUrl, placeholderImage: nil)
    }
}

extension HomePeopleCell {
    private func setupViews() {
        contentView.addSubviews([
            cardView,
            imageView,
            nameLabel
        ])
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8),
            nameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8)
        ])
    }
}
