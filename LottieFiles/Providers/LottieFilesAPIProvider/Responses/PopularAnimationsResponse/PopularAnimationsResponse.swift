//
//  PopularAnimationsResponse.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import Foundation

struct PopularAnimationsResponse: Decodable {
    let data: DataResponse
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    enum PopularKeys: String, CodingKey {
        case popular
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: PopularKeys.self, forKey: .data)
        self.data = try dataContainer.decode(DataResponse.self, forKey: .popular)
    }
}
