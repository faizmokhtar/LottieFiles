//
//  LottieResponseTests.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import XCTest
@testable import LottieFiles

class LottieResponseTests: XCTestCase {

    func testLottieResponse_givenJSON_itShouldDecode() {
        let input = """
        {
            "id": 68228,
            "bgColor": "#FFFFFF",
            "lottieUrl": "https://assets7.lottiefiles.com/packages/lf20_ijv6guhj.json",
            "gifUrl": null,
            "videoUrl": null,
            "imageUrl": "https://assets.lottiefiles.com/previews/default.jpg",
            "createdAt": "2021-07-09T03:20:20.000Z",
            "name": "Robotic Animated Font Letter B",
            "createdBy": {
                "avatarUrl": "https://assets9.lottiefiles.com/avatars/300_94765-702240734.jpg",
                "name": "Ilya Gusinski"
            }
        }
        """.data(using: .utf8)!
        
        do {
            let response = try JSONDecoder().decode(LottieResponse.self, from: input)
            XCTAssertNotNil(response)
        } catch {
            XCTFail("decoding error: \(error)")
        }
    }
}
