//
//  WeatherForecastWeatherForecastPresenter.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

class WeatherForecastPresenter: WeatherForecastModuleInput, WeatherForecastViewOutput, WeatherForecastInteractorOutput {

    weak var view: WeatherForecastViewInput!
    var interactor: WeatherForecastInteractorInput!
    var router: WeatherForecastRouterInput!

    func viewIsReady() {

    }

    func findForecast(forText text: String?) {
        // todo chech this condition on null exception
        guard let city = text, !(text?.isEmpty)! else {
            return
        }
        interactor.findForecast(forCity: city)
    }

    func gotWeatherForecast(_ forecast: WeatherResponse) {
        view.showWeatherForecast(forecast.list!)
        view.changeTitle(forecast.city!.name!)
    }
}
