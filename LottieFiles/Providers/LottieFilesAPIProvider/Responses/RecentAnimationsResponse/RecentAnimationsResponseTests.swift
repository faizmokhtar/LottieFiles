//
//  RecentAnimationsResponseTests.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 11/03/2022.
//

import XCTest
@testable import LottieFiles

class RecentAnimationsResponseTests: XCTestCase {

    func testRecentAnimationsResponse_givenJSON_itShouldDecode() {
        let input = """
        {
            "data": {
                "recent": {
                    "currentPage": 1,
                    "perPage": 12,
                    "totalPages": 316,
                    "from": 1,
                    "to": 12,
                    "total": 3791,
                    "results": []
                }
            }
        }
        """.data(using: .utf8)!
        
        do {
            let response = try JSONDecoder().decode(RecentAnimationsResponse.self, from: input)
            XCTAssertNotNil(response)
        } catch {
            XCTFail("decoding error: \(error)")
        }
    }
}
