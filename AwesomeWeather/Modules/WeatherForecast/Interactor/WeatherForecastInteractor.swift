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
        _ = weatherProviderService.findForecast(forCity: city)
            .subscribe { (event) in
                guard let element = event.element else {
                    return
                }
                print("New Weather for \(city)")
                self.output.gotWeatherForecast(element)
        }
    }
}
