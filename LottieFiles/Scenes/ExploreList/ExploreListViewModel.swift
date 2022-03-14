//
//  ExploreListViewModel.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 10/03/2022.
//

import Foundation
import Combine

class ExploreListViewModel: ObservableObject {
    
    @Published var cellViewModels = [ExploreCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let type: ExploreType
    private let apiProvider: LottieFilesAPIProvider
    
    init(
        type: ExploreType,
        apiProvider: LottieFilesAPIProvider = LottieFilesAPIProvider()
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
            .map { $0.map { ExploreCellViewModel(response: $0) } }
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
            .map { $0.map { ExploreCellViewModel(response: $0) } }
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
            .map { $0.map { ExploreCellViewModel(response: $0) } }
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] viewModels in
                self?.cellViewModels = viewModels
            }
            .store(in: &cancellables)
    }
}
