//
//  DateExtensionsTests.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/21/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import XCTest
@testable import AwesomeWeather

class DateExtensionsTests: XCTestCase {

    let positiveDateChank = TimeInterval(10000)
    let negativeDateChank = TimeInterval(-10000)

    func test_IsGreaterThanDate_DateToCompareGreater_False() {
        // given
        let target = NSDate()
        let dateToCompare = Date().addingTimeInterval(positiveDateChank)

        // when
        let result = target.isGreaterThanDate(dateToCompare: dateToCompare)
        
        // then
        XCTAssertFalse(result)
    }

    func test_IsGreaterThanDate_DateToCompareLess_True() {
        // given
        let target = NSDate()
        let dateToCompare = Date().addingTimeInterval(negativeDateChank)

        // when
        let result = target.isGreaterThanDate(dateToCompare: dateToCompare)

        // then
        XCTAssertTrue(result)
    }

    func test_IsLessThanDate_DateToCompareGreater_True() {
        // given
        let target = NSDate()
        let dateToCompare = Date().addingTimeInterval(positiveDateChank)

        // when
        let result = target.isLessThanDate(dateToCompare: dateToCompare)

        // then
        XCTAssertTrue(result)
    }

    func test_IsLessThanDate_DateToCompareLess_False() {
        // given
        let target = NSDate()
        let dateToCompare = Date().addingTimeInterval(negativeDateChank)

        // when
        let result = target.isLessThanDate(dateToCompare: dateToCompare)

        // then
        XCTAssertFalse(result)
    }
}

