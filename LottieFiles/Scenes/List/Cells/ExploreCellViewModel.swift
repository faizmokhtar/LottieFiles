//
//  ExploreCellViewModel.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 10/03/2022.
//

import Foundation

struct ExploreCellViewModel {
    
    var url: URL? {
        return URL(string: urlString)
    }
    
    let urlString: String
    
    init(urlString: String = "https://assets10.lottiefiles.com/packages/lf20_edfab5bo.json") {
        self.urlString = urlString
    }
}
