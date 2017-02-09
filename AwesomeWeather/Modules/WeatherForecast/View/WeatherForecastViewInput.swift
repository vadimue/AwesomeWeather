//
//  WeatherForecastWeatherForecastViewInput.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

protocol WeatherForecastViewInput: class {

    /**
        @author Vadim Brusko
        Setup initial state of the view
    */

    func setupInitialState()

    func showWeatherForecast(_ forecast: [WeatherDetails]);
    func changeTitle(_ title: String);
}
