//
//  FeaturedAnimatorsResponse.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import Foundation

// MARK: - FeaturedAnimatorsResponse
struct FeaturedAnimatorsResponse: Decodable {
    let data: AnimatorsResultResponse
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    enum AnimatorKeys: String, CodingKey {
        case featuredAnimators
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: AnimatorKeys.self, forKey: .data)
        self.data = try dataContainer.decode(AnimatorsResultResponse.self, forKey: .featuredAnimators)
    }
}


// MARK: - AnimatorsResultResponse
struct AnimatorsResultResponse: Decodable {
    let results: [AnimatorResponse]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

// MARK: - AnimatorResponse
struct AnimatorResponse: Decodable {
    let name: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case avatarURL = "avatarUrl"
    }
}
