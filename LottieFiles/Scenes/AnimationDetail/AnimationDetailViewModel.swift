//
//  AnimationDetailViewModel.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 14/03/2022.
//

import Foundation

class AnimationDetailViewModel {
    
    var lottieURL: URL {
        return url ?? URL(string: "dummy")!
    }
    private let url: URL?

    init(url: URL?) {
        self.url = url
    }
}
