//
//  LottieFilesAPIProvider.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import Foundation
import Combine

struct AnimatorsResponse: Decodable {}

protocol LottieFilesAPIProtocol {
    func fetchFeaturedAnimations() -> AnyPublisher<FeaturedAnimationsResponse, Error>
    
    func fetchPopularAnimations() -> AnyPublisher<PopularAnimationsResponse, Error>
    
    func fetchRecentAnimations() -> AnyPublisher<RecentAnimationsResponse,  Error>
    
    func fetchAnimators() -> AnyPublisher<FeaturedAnimatorsResponse, Error>
    
    func fetchBlogs()-> AnyPublisher<BlogsResponse, Error>
}

class LottieFilesAPIProvider: LottieFilesAPIProtocol {
    func fetchAnimators() -> AnyPublisher<FeaturedAnimatorsResponse, Error> {
        return Empty().eraseToAnyPublisher()
    }
    
    func fetchBlogs() -> AnyPublisher<BlogsResponse, Error> {
        return  Empty().eraseToAnyPublisher()
    }
    
    func fetchPopularAnimations() -> AnyPublisher<PopularAnimationsResponse, Error> {
        return Empty().eraseToAnyPublisher()
    }
    
    func fetchRecentAnimations() -> AnyPublisher<RecentAnimationsResponse, Error> {
        return Empty().eraseToAnyPublisher()
    }
    
    func fetchFeaturedAnimations() -> AnyPublisher<FeaturedAnimationsResponse, Error> {
        return Empty().eraseToAnyPublisher()
    }
}
