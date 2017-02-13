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

    var initialWeatherDetails: WeatherDetails?

    func viewIsReady() {
        guard let weatherDetails = initialWeatherDetails else { return }
        view.setupInitialState(withWeatherDetails: weatherDetails)
    }

    func configureWith(weatherDetails: WeatherDetails) {
        initialWeatherDetails = weatherDetails
    }
}
