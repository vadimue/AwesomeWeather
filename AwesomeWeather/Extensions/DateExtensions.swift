//
//  DateExtensions.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/21/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation

extension NSDate {

    func isGreaterThanDate(dateToCompare: Date) -> Bool {
        var isGreater = false

        if self.compare(dateToCompare) == ComparisonResult.orderedDescending {
            isGreater = true
        }

        return isGreater
    }

    func isLessThanDate(dateToCompare: Date) -> Bool {
        var isLess = false

        if self.compare(dateToCompare) == ComparisonResult.orderedAscending {
            isLess = true
        }

        return isLess
    }
}
