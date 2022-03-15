//
//  AnimationView+Extensions.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 14/03/2022.
//

import Foundation
import Lottie

extension AnimationView {
    func loadFromUrl(_ url: URL) {
        Animation.loadedFrom(url: url, closure: { [weak self] animation in
            guard let self = self else { return }
            self.animation = animation
            self.play()
        }, animationCache: LRUAnimationCache.sharedCache)
    }
}
