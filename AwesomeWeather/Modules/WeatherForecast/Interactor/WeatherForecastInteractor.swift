//
//  WeatherForecastWeatherForecastInteractor.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

class WeatherForecastInteractor: WeatherForecastInteractorInput {

    weak var output: WeatherForecastInteractorOutput!

    var weatherProviderService: WeatherProviderService!

    func findForecast(forCity city: String) {
        weatherProviderService.findForecast(forCity: city) { (response) in
            self.output.gotWeatherForecast(response)
        }
    }
}
