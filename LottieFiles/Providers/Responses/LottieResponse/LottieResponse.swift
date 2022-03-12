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
    let gifURL: String?
    let videoURL: String?
    let imageURL: String
    let createdAt: Date
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

extension LottieResponse {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        bgColor = try container.decode(String.self, forKey: .bgColor)
        lottieURL = try container.decode(String.self, forKey: .lottieURL)
        gifURL = try container.decodeIfPresent(String.self, forKey: .gifURL)
        videoURL = try container.decodeIfPresent(String.self, forKey: .videoURL)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        
        let createdAtString = try container.decode(String.self, forKey: .createdAt)
        if let createdAt = DateFormatter.iso8601Full.date(from: createdAtString) {
            self.createdAt = createdAt
        } else {
            throw DecodingError.dataCorruptedError(forKey: .createdAt, in: container, debugDescription: "decoding error: date can't match .iso8601Full format")
        }
        name = try container.decode(String.self, forKey: .name)
        createdBy = try container.decode(LottieCreatedByResponse.self, forKey: .createdBy)
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

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
