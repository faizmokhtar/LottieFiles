//
//  BlogsResponseTests.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import XCTest
@testable import LottieFiles

class BlogsResponseTests: XCTestCase {
    func testBlogsResponse_givenJSON_itShouldDecode() {
        let input = """
        {
            "data": {
                "blogs": {
                    "currentPage": 1,
                    "perPage": 16,
                    "totalPages": 6,
                    "from": 1,
                    "to": 16,
                    "total": 83,
                    "results": [
                        {
                            "title": "The Key to An Immersive UX: Animation",
                            "postedAt": "2021-07-08T00:00:00.000Z",
                            "imageUrl": "https://d3jl769oy69y7b.cloudfront.net/2021/07/Blog-Visual---The-Key-to-An-Immersive-UX_-Animation.png"
                        }
                    ]
                }
            }
        }
        """.data(using: .utf8)!
        
        do {
            let response = try JSONDecoder().decode(BlogsResponse.self, from: input)
            XCTAssertNotNil(response)
        } catch {
            XCTFail("decoding error: \(error)")
        }
    }
}
