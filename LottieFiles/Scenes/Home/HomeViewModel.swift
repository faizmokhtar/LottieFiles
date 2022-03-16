//
//  HomeViewModel.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import Foundation
import Combine

class HomeViewModel {
    
    @Published var sections = [Section]()
    
    private var cancellables = Set<AnyCancellable>()
    
    let apiProvider: LottieFilesAPIProvider
    
    init(
        apiProvider: LottieFilesAPIProvider = LottieFilesAPIProvider()
    ) {
        self.apiProvider = apiProvider
    }
}

extension HomeViewModel {
    func fetchSections() {
        Publishers.Zip3(
            fetchFeatured(),
            fetchAnimators(),
            fetchBlogs()
        )
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] featuredSection, featuredPeople, featureBlogs in
                self?.sections = [featuredSection, featuredPeople, featureBlogs]
            })
            .store(in: &cancellables)
            
    }
}

extension HomeViewModel {
    private func fetchAnimators() -> AnyPublisher<Section, Error> {
        return apiProvider.fetchAnimators()
            .map { $0.data }
            .map { $0.results }
            .map { $0.map { HomeItem(animatorResponse: $0) } }
            .map { response in
                Section(title: "Featured Animators", type: .people, items: response)
            }
            .eraseToAnyPublisher()
    }

    private func fetchFeatured() -> AnyPublisher<Section, Error> {
        return apiProvider.fetchFeaturedAnimations()
            .map { $0.data }
            .map { $0.results }
            .map { $0.map { HomeItem(response: $0) } }
            .map { response in
                Section(title: "Featured Animations", type: .featured, items: response)
            }.eraseToAnyPublisher()
    }
    
    private func fetchBlogs() -> AnyPublisher<Section, Error> {
        return apiProvider.fetchBlogs()
            .map { $0.data }
            .map { $0.results.prefix(5) }
            .map { $0.map { HomeItem(blogResponse: $0) } }
            .map { response in
                Section(title: "Latest Stories", type: .blog, items: response)
            }.eraseToAnyPublisher()
    }
}
