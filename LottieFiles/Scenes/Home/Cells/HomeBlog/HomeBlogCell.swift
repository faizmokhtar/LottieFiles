//
//  HomeBlogCell.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import UIKit

class HomeBlogCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        view.clipsToBounds = true
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.lineBreakMode = .byTruncatingTail
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

extension HomeBlogCell: SelfConfiguringCell {
    static var reuseIdentifier: String {
        return "HomeBlogCell"
    }
    
    func configure(with item: HomeItem) {
        
    }
}

extension HomeBlogCell {
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            imageView.widthAnchor.constraint(equalToConstant: 120),

            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }
}
