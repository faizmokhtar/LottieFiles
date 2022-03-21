//
//  HomeLoginCell.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import UIKit

class HomeLoginCell: UICollectionViewCell {
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 14)
        view.textColor = .secondaryLabel
        return view
    }()
    
    private lazy var helloLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 20, weight: .medium)
        return view
    }()
    
    private lazy var loginLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Login / Create Account"
        view.font = .systemFont(ofSize: 14)
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

extension HomeLoginCell: SelfConfiguringCell {
    static var reuseIdentifier: String {
        return "HomeLoginCell"
    }
    
    func configure(with item: HomeItem) {
        dateLabel.text = item.loginDate
        if let name = item.loggedInUsername {
            helloLabel.text = "Hello \(name.capitalized)"
            loginLabel.isHidden = true
        } else {
            helloLabel.text = "Hello Stranger"
            loginLabel.isHidden = false
        }
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
