//
//  ShareButton.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 17/03/2022.
//

import UIKit

class ShareButton: UIButton {

    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .App.secondary
        return view
    }()
    
    private lazy var textLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        return view
    }()
    
    private lazy var detailLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .right
        view.textColor = .secondaryLabel
        return view
    }()
    
    required init(iconImage: UIImage?, title: String, detail: String?) {
        super.init(frame: .zero)
        iconImageView.image = iconImage
        textLabel.text = title
        detailLabel.text = detail
        backgroundColor = .App.secondaryButtonDefault
        layer.cornerRadius = 10
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

extension ShareButton {
    private func setupViews() {
        addSubviews([
            iconImageView,
            textLabel,
            detailLabel
        ])
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            textLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            detailLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            detailLabel.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 10),
            detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
