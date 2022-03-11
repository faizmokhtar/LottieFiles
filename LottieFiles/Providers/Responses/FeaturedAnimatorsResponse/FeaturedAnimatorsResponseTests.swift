//
//  FeaturedAnimatorsResponseTests.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import XCTest
@testable import LottieFiles

class FeaturedAnimatorsResponseTests: XCTestCase {
    func testFeaturedAnimatorsResponse_givenJSON_itShouldDecode() {
        let input = """
        {
            "data": {
                "featuredAnimators": {
                    "results": [
                        {
                            "name": "Kevin Correa",
                            "avatarUrl": "https://assets4.lottiefiles.com/avatars/300_60abcb0579641.jpg"
                        },
                        {
                            "name": "Alexander Plaksin",
                            "avatarUrl": "https://assets5.lottiefiles.com/avatars/300_487756-994436705.jpg"
                        },
                        {
                            "name": "Vanessa Urrunaga",
                            "avatarUrl": "https://assets2.lottiefiles.com/avatars/300_60df0a5dbd4f5.jpg"
                        },
                        {
                            "name": "Jacques Mauriac",
                            "avatarUrl": "https://assets10.lottiefiles.com/avatars/300_454-630591834.jpg"
                        },
                        {
                            "name": "Real Life Romi",
                            "avatarUrl": "https://assets9.lottiefiles.com/avatars/300_60e0643ac7a57.jpg"
                        },
                        {
                            "name": "S M Rony",
                            "avatarUrl": "https://assets9.lottiefiles.com/avatars/300_796364-1639717700.jpg"
                        }
                    ]
                }
            }
        }
        """.data(using: .utf8)!
        
        do {
            let response = try JSONDecoder().decode(FeaturedAnimatorsResponse.self, from: input)
            XCTAssertNotNil(response)
        } catch {
            XCTFail("decoding error: \(error)")
        }
    }
}
