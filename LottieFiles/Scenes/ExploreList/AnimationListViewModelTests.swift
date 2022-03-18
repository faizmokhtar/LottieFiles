//
//  AnimationListViewModelTests.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import XCTest
import Combine

@testable import LottieFiles
class AnimationListViewModelTests: XCTestCase {    
    func testAnimationListViewModel_givenFeaturedType_thenFeaturedAnimationAPIShouldBeCalled() {
        let spy = MockLottieFilesAPIProvider()
        let viewModel = AnimationListViewModel(type: .featured, apiProvider: spy)
        
        viewModel.fetchList()
        
        XCTAssertTrue(spy.isFetchFeaturedAnimationsBeingCalled)
    }
    
    func testAnimationListViewModel_givenRecentType_thenRecentAnimationAPIShouldBeCalled() {
        let spy = MockLottieFilesAPIProvider()
        let viewModel = AnimationListViewModel(type: .recent, apiProvider: spy)
        
        viewModel.fetchList()
        
        XCTAssertTrue(spy.isFetchRecentAnimationsBeingCalled)
    }
    
    func testAnimationListViewModel_givenPopularType_thenPopularAnimationAPIShouldBeCalled() {
        let spy = MockLottieFilesAPIProvider()
        let viewModel = AnimationListViewModel(type: .popular, apiProvider: spy)
        
        viewModel.fetchList()
        
        XCTAssertTrue(spy.isFetchPopularAnimationsBeingCalled)
    }
}
