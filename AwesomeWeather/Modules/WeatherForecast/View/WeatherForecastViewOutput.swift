//
//  WeatherForecastWeatherForecastViewOutput.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

protocol WeatherForecastViewOutput {

    /**
        @author Vadim Brusko
        Notify presenter that view is ready
    */

    func viewIsReady()
    func findForecast(forText text: String?)
    func didSelectRow(withWeatherDetails weatherDetails: WeatherDetails)
}
