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
}
