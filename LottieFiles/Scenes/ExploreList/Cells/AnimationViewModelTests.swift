//
//  AnimationViewModelTests.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import XCTest
@testable import LottieFiles

class AnimationViewModelTests: XCTestCase {

    var sut: AnimationViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = AnimationViewModel(response: mockResponse())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testAnimationViewModel_givenResponse_itShouldInitProperly() {
        XCTAssertEqual("Loading payment", sut.name)
        XCTAssertEqual("Juliano Sousa", sut.username)
    }
}

extension AnimationViewModelTests {
    func mockResponse() -> LottieResponse {
        let input = """
        {
            "id": 68226,
            "bgColor": "#FFFFFF",
            "lottieUrl": "https://assets6.lottiefiles.com/packages/lf20_jffprore.json",
            "gifUrl": "https://assets8.lottiefiles.com/render/kqvus3s8.gif",
            "videoUrl": "https://assets8.lottiefiles.com/render/kqvus3s8.mp4",
            "imageUrl": "https://assets7.lottiefiles.com/render/kqvus3s8.png",
            "createdAt": "2021-07-09T01:56:03.000Z",
            "name": "Loading payment",
            "createdBy": {
                "avatarUrl": "https://assets9.lottiefiles.com/avatars/300_6086dce22e4e3.jpg",
                "name": "Juliano Sousa"
            }
        }
        """.data(using: .utf8)!
        
        let response = try! JSONDecoder().decode(LottieResponse.self, from: input)
        return response
    }
}
