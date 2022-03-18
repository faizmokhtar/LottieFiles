//
//  SelfConfiguringCell.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseIdentifier: String { get }
    func configure(with item: HomeItem)
}
