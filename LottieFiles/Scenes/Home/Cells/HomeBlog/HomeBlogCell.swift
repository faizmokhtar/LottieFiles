//
//  HomeBlogCell.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import UIKit

class HomeBlogCell: UICollectionViewCell {
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
        
    }
}
