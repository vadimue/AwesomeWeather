//
//  DetailWeatherDetailWeatherConfiguratorTests.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 10/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import XCTest

class DetailWeatherModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = DetailWeatherViewControllerMock()
        let configurator = DetailWeatherModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "DetailWeatherViewController is nil after configuration")
        XCTAssertTrue(viewController.output is DetailWeatherPresenter, "output is not DetailWeatherPresenter")

        let presenter: DetailWeatherPresenter = viewController.output as! DetailWeatherPresenter
        XCTAssertNotNil(presenter.view, "view in DetailWeatherPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in DetailWeatherPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is DetailWeatherRouter, "router is not DetailWeatherRouter")

        let interactor: DetailWeatherInteractor = presenter.interactor as! DetailWeatherInteractor
        XCTAssertNotNil(interactor.output, "output in DetailWeatherInteractor is nil after configuration")
    }

    class DetailWeatherViewControllerMock: DetailWeatherViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
