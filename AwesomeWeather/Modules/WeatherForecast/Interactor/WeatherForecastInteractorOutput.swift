//
//  WeatherForecastWeatherForecastInteractorOutput.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import Foundation

protocol WeatherForecastInteractorOutput: class {
    func gotWeatherForecast(_ forecast: WeatherResponse)
}
