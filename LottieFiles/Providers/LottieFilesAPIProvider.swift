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
    
    let baseURL = URL(string: "https://firebasestorage.googleapis.com/v0/b/lottiefiles-test.appspot.com/o/")!
    let queryItems = [
        URLQueryItem(name: "alt", value: "media"),
        URLQueryItem(name: "token", value: "f5acfd96-384a-4552-a0b5-399675a03826")
    ]
    private let decoder = JSONDecoder()
    
    func fetchAnimators() -> AnyPublisher<FeaturedAnimatorsResponse, Error> {
        guard let url = baseURL.appendingPathComponent("featuredAnimators.json")
                .appending(queryItems) else {
                    return Empty().eraseToAnyPublisher()
                }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: FeaturedAnimatorsResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func fetchBlogs() -> AnyPublisher<BlogsResponse, Error> {
        guard let url = baseURL.appendingPathComponent("blogs.json")
                .appending(queryItems) else {
                    return Empty().eraseToAnyPublisher()
                }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: BlogsResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func fetchPopularAnimations() -> AnyPublisher<PopularAnimationsResponse, Error> {
        guard let url = baseURL.appendingPathComponent("popularAnimations.json")
                .appending(queryItems) else {
                    return Empty().eraseToAnyPublisher()
                }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PopularAnimationsResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func fetchRecentAnimations() -> AnyPublisher<RecentAnimationsResponse, Error> {
        guard let url = baseURL.appendingPathComponent("recentAnimations.json")
                .appending(queryItems) else {
                    return Empty().eraseToAnyPublisher()
                }
        
        print(url.absoluteString)
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: RecentAnimationsResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func fetchFeaturedAnimations() -> AnyPublisher<FeaturedAnimationsResponse, Error> {
        guard let url = baseURL.appendingPathComponent("featuredAnimations.json")
                .appending(queryItems) else {
                    return Empty().eraseToAnyPublisher()
                }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: FeaturedAnimationsResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
