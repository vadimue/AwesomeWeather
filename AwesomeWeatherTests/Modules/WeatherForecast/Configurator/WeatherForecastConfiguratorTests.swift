//
//  WeatherForecastWeatherForecastConfiguratorTests.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import XCTest
@testable import AwesomeWeather

class WeatherForecastModuleConfiguratorTests: XCTestCase {

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
        let viewController = WeatherForecastViewControllerMock()
        let configurator = WeatherForecastModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "WeatherForecastViewController is nil after configuration")
        XCTAssertTrue(viewController.output is WeatherForecastPresenter, "output is not WeatherForecastPresenter")

        let presenter: WeatherForecastPresenter = viewController.output as! WeatherForecastPresenter
        XCTAssertNotNil(presenter.view, "view in WeatherForecastPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in WeatherForecastPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is WeatherForecastRouter, "router is not WeatherForecastRouter")

        let interactor: WeatherForecastInteractor = presenter.interactor as! WeatherForecastInteractor
        XCTAssertNotNil(interactor.output, "output in WeatherForecastInteractor is nil after configuration")
    }

    class WeatherForecastViewControllerMock: WeatherForecastViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
