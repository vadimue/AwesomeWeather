//
//  WeatherForecastWeatherForecastInteractor.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

class WeatherForecastInteractor: WeatherForecastInteractorInput {

    weak var output: WeatherForecastInteractorOutput!

    var weatherService: WeatherService!

    func findForecast(forCity city: String) {
        weatherService.obtainForecast(forCity: city) { (response) in
            guard let weatherForecast = response.result.value else {
                return
            }
            self.output.gotWeatherForecast(weatherForecast)
        }
    }
}
