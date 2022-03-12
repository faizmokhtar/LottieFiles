//
//  ExploreViewModel.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import Foundation
import Combine
class ExploreViewModel {
    
    let apiProvider: LottieFilesAPIProvider
    
    var cancellables = Set<AnyCancellable>()

    init(
        apiProvider: LottieFilesAPIProvider = LottieFilesAPIProvider()
    ) {
        self.apiProvider = apiProvider
        setupBindings()
    }
}

extension ExploreViewModel {
    private func setupBindings() {
        apiProvider.fetchRecentAnimations()
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { animations in
                print(animations)
            })
            .store(in: &cancellables)
    }
}
