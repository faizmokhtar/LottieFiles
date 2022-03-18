//
//  QRDetailViewModel.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import Foundation

class QRDetailViewModel {
    
    var url: URL {
        return URL(string: urlString)!
    }
    
    private let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
}
