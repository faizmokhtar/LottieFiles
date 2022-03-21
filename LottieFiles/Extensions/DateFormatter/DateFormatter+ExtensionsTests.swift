//
//  DateFormatter+ExtensionsTests.swift
//  LottieFilesTests
//
//  Created by AD0502-ADE-MB-1 on 21/03/2022.
//

import XCTest
@testable import LottieFiles

class DateFormatter_ExtensionsTests: XCTestCase {
    func testDateFormatter_givenSimpleFormatter_itShouldFormatCorrectly() {
        let input = make(day: 9, month: 3, year: 2022)
        let sut = DateFormatter.simple.string(from: input)
        
        let expected = "Wednesday, March 9"
        
        XCTAssertEqual(sut, expected)
    }
}

extension DateFormatter_ExtensionsTests {
    func make(day: Int, month: Int, year: Int) -> Date {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(from: components)!
    }
}
