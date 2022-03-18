//
//  MockLottieFilesAPIProvider.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import Foundation
import Combine
@testable import LottieFiles

class MockLottieFilesAPIProvider: LottieFilesAPIProtocol {
    
    var isFetchFeaturedAnimationsBeingCalled = false
    var isFetchPopularAnimationsBeingCalled = false
    var isFetchRecentAnimationsBeingCalled = false
    var isFetchAnimatorsBeingCalled = false
    var isFetchBlogsBeingCalled = false

    init() {
    }
    
    func fetchFeaturedAnimations() -> AnyPublisher<FeaturedAnimationsResponse, Error> {
        isFetchFeaturedAnimationsBeingCalled = true
        return Just(FeaturedAnimationsResponse.mock())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchPopularAnimations() -> AnyPublisher<PopularAnimationsResponse, Error> {
        isFetchPopularAnimationsBeingCalled = true
        return Just(PopularAnimationsResponse.mock())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchRecentAnimations() -> AnyPublisher<RecentAnimationsResponse, Error> {
        isFetchRecentAnimationsBeingCalled = true
        return Just(RecentAnimationsResponse.mock())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchAnimators() -> AnyPublisher<FeaturedAnimatorsResponse, Error> {
        isFetchAnimatorsBeingCalled = true
        return Just(FeaturedAnimatorsResponse.mock())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchBlogs() -> AnyPublisher<BlogsResponse, Error> {
        isFetchBlogsBeingCalled = true
        return Just(BlogsResponse.mock())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    
}
