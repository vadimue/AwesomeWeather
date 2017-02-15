//
//  DetailWeatherDetailWeatherPresenter.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 10/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import Foundation

class DetailWeatherPresenter: NSObject, DetailWeatherModuleInput, DetailWeatherViewOutput, DetailWeatherInteractorOutput {

    weak var view: DetailWeatherViewInput!
    var interactor: DetailWeatherInteractorInput!
    var router: DetailWeatherRouterInput!

    var initialWeather: Weather?

    func viewIsReady() {
        guard let weather = initialWeather else { return }
        view.setupInitialState(withWeather: weather)
    }

    func configureWith(weather: Weather) {
        initialWeather = weather
    }
}
