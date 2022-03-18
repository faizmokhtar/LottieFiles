//
//  LottieFilesAPIProvider.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import Foundation
import Combine

class LottieFilesAPIProvider: LottieFilesAPIProtocol {
    
    let baseURL = URL(string: "https://firebasestorage.googleapis.com/v0/b/lottiefiles-test.appspot.com/o/")!

    var queryItems = [
        URLQueryItem(name: "alt", value: "media"),
        URLQueryItem(name: "token", value: "f5acfd96-384a-4552-a0b5-399675a03826")
    ]

    private let decoder = JSONDecoder()

    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: configuration)
    }()
    
    func fetchAnimators() -> AnyPublisher<FeaturedAnimatorsResponse, Error> {
        let queryItems = [
            URLQueryItem(name: "alt", value: "media"),
            URLQueryItem(name: "token", value: "5b3e8205-b317-45c4-a5ce-36c9dc57911d")
        ]

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
        let queryItems = [
            URLQueryItem(name: "alt", value: "media"),
            URLQueryItem(name: "token", value: "c6bf2153-7a69-4a47-9e3a-6f7500d8f523")
        ]

        guard let url = baseURL.appendingPathComponent("blogs.json")
                .appending(queryItems) else {
                    return Empty().eraseToAnyPublisher()
                }
        
        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: BlogsResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func fetchPopularAnimations() -> AnyPublisher<PopularAnimationsResponse, Error> {
        let queryItems = [
            URLQueryItem(name: "alt", value: "media"),
            URLQueryItem(name: "token", value: "a32b4948-d278-4923-880e-8fb57741c190")
        ]

        guard let url = baseURL.appendingPathComponent("popularAnimations.json")
                .appending(queryItems) else {
                    return Empty().eraseToAnyPublisher()
                }
        
        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PopularAnimationsResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func fetchRecentAnimations() -> AnyPublisher<RecentAnimationsResponse, Error> {
        let queryItems = [
            URLQueryItem(name: "alt", value: "media"),
            URLQueryItem(name: "token", value: "f5acfd96-384a-4552-a0b5-399675a03826")
        ]

        guard let url = baseURL.appendingPathComponent("recentAnimations.json")
                .appending(queryItems) else {
                    return Empty().eraseToAnyPublisher()
                }
        
        print(url.absoluteString)
        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: RecentAnimationsResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func fetchFeaturedAnimations() -> AnyPublisher<FeaturedAnimationsResponse, Error> {
        let queryItems = [
            URLQueryItem(name: "alt", value: "media"),
            URLQueryItem(name: "token", value: "f6e406f5-befb-40ab-a9b0-bb0a773b09fd")
        ]

        guard let url = baseURL.appendingPathComponent("featuredAnimations.json")
                .appending(queryItems) else {
                    return Empty().eraseToAnyPublisher()
                }
        
        return session.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: FeaturedAnimationsResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
