//
//  HomeLoginCell.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import UIKit

class HomeLoginCell: UICollectionViewCell {
    private let dateLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Wednesday, March 9"
        return view
    }()
    
    private let helloLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hello Stranger"
        return view
    }()
    
    private let loginLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Login / Create Account"
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

extension HomeLoginCell: SelfConfiguringCell {
    static var reuseIdentifier: String {
        return "HomeLoginCell"
    }
    
    func configure(with item: HomeItem) {
        
    }
}

extension HomeLoginCell {
    private func setupViews() {
        contentView.addSubviews([
            dateLabel,
            helloLabel,
            loginLabel
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            helloLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            helloLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            helloLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 8),
            loginLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            loginLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
