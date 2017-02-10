//
//  DetailWeatherDetailWeatherPresenterTests.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 10/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import XCTest

class DetailWeatherPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: DetailWeatherInteractorInput {

    }

    class MockRouter: DetailWeatherRouterInput {

    }

    class MockViewController: DetailWeatherViewInput {

        func setupInitialState() {

        }
    }
}
