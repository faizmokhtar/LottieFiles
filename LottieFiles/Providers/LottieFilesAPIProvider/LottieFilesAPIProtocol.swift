//
//  LottieFilesAPIProtocol.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import Foundation
import Combine
protocol LottieFilesAPIProtocol {
    func fetchFeaturedAnimations() -> AnyPublisher<FeaturedAnimationsResponse, Error>
    
    func fetchPopularAnimations() -> AnyPublisher<PopularAnimationsResponse, Error>
    
    func fetchRecentAnimations() -> AnyPublisher<RecentAnimationsResponse,  Error>
    
    func fetchAnimators() -> AnyPublisher<FeaturedAnimatorsResponse, Error>
    
    func fetchBlogs()-> AnyPublisher<BlogsResponse, Error>
}
