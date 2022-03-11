//
//  BlogsResponse.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import Foundation

// MARK: - BlogsResponse
struct BlogsResponse: Decodable {
    let data: BlogsDataResponse
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    enum BlogsKeys: String, CodingKey {
        case blogs
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: BlogsKeys.self, forKey: .data)
        self.data = try dataContainer.decode(BlogsDataResponse.self, forKey: .blogs)
    }

}

// MARK: - BlogsDataResponse
struct BlogsDataResponse: Codable {
    let currentPage: Int
    let perPage: Int
    let totalPages: Int
    let from: Int
    let to: Int
    let total: Int
    let results: [Blog]
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "currentPage"
        case perPage = "perPage"
        case totalPages = "totalPages"
        case from = "from"
        case to = "to"
        case total = "total"
        case results = "results"
    }
}

// MARK: - Result
struct Blog: Codable {
    let title: String
    let postedAt: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case postedAt = "postedAt"
        case imageURL = "imageUrl"
    }
}

