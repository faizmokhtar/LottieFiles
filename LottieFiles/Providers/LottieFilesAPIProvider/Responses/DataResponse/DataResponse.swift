//
//  DataResponse.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import Foundation

// MARK: - DataResponse
struct DataResponse: Decodable {
    let currentPage: Int
    let perPage: Int
    let totalPages: Int
    let from: Int
    let to: Int
    let total: Int
    let results: [LottieResponse]
    
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
