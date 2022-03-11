//
//  LottieResponse.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import Foundation

// MARK: - LottieResponse
struct LottieResponse: Decodable {
    let id: Int
    let bgColor: String
    let lottieURL: String
    let gifURL: String
    let videoURL: String
    let imageURL: String
    let createdAt: String
    let name: String
    let createdBy: LottieCreatedByResponse
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case bgColor = "bgColor"
        case lottieURL = "lottieUrl"
        case gifURL = "gifUrl"
        case videoURL = "videoUrl"
        case imageURL = "imageUrl"
        case createdAt = "createdAt"
        case name = "name"
        case createdBy = "createdBy"
    }
}

// MARK: - LottieCreatedByResponse
struct LottieCreatedByResponse: Decodable {
    let avatarURL: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatarUrl"
        case name = "name"
    }
}
