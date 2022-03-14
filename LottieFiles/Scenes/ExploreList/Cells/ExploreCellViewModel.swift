//
//  ExploreCellViewModel.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 10/03/2022.
//

import Foundation
import UIKit

struct ExploreCellViewModel {
    
    var lottieURL: URL? {
        return URL(string: response.lottieURL)
    }
    
    var name: String {
        return response.name
    }
    
    var username: String {
        return response.createdBy.name
    }
    
    var backgroundColor: UIColor?  {
        return UIColor(hex: response.bgColor)
    }
    
    var avatarURL: URL? {
        return URL(string: response.createdBy.avatarURL)
    }
    
    // MARK: - Inits

    private let response: LottieResponse

    init(response: LottieResponse) {
        self.response = response
    }
}
