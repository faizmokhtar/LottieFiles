//
//  FeaturedAnimationsResponse.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import Foundation

// MARK: - FeaturedAnimationsResponse
struct FeaturedAnimationsResponse: Decodable {
    let data: DataResponse
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    enum FeaturedKeys: String, CodingKey {
        case featured
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: FeaturedKeys.self, forKey: .data)
        self.data = try dataContainer.decode(DataResponse.self, forKey: .featured)
    }
}
