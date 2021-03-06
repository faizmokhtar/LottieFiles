//
//  ExploreListViewModel.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 10/03/2022.
//

import Foundation
import Combine

class AnimationListViewModel: ObservableObject {
    
    @Published var cellViewModels = [AnimationViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let type: ExploreType
    private let apiProvider: LottieFilesAPIProtocol
    
    init(
        type: ExploreType,
        apiProvider: LottieFilesAPIProtocol = LottieFilesAPIProvider()
    ) {
        self.type = type
        self.apiProvider = apiProvider
    }
    
    func fetchList() {
        switch type {
        case .recent:
            fetchRecent()
        case .featured:
            fetchFeatured()
        case .popular:
            fetchPopular()
        }
    }
    
    private func fetchRecent() {
        apiProvider.fetchRecentAnimations()
            .map { $0.data }
            .map { $0.results }
            .map { $0.map { AnimationViewModel(response: $0) } }
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] viewModels in
                self?.cellViewModels = viewModels
            }
            .store(in: &cancellables)
    }
    
    private func fetchFeatured() {
        apiProvider.fetchFeaturedAnimations()
            .map({ $0.data })
            .map({ $0.results })
            .map { $0.map { AnimationViewModel(response: $0) } }
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] viewModels in
                self?.cellViewModels = viewModels
            }
            .store(in: &cancellables)
    }
    
    private func fetchPopular() {
        apiProvider.fetchPopularAnimations()
            .map { $0.data }
            .map { $0.results }
            .map { $0.map { AnimationViewModel(response: $0) } }
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] viewModels in
                self?.cellViewModels = viewModels
            }
            .store(in: &cancellables)
    }
}
