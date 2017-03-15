//
//  WeatherForecastWeatherForecastPresenter.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import RxSwift

class WeatherForecastPresenter: WeatherForecastModuleInput, WeatherForecastViewOutput, WeatherForecastInteractorOutput {

    weak var view: WeatherForecastViewInput!
    var interactor: WeatherForecastInteractorInput!
    var router: WeatherForecastRouterInput!

    func viewIsReady() {

    }

    func didSelectRow(withWeatherDetails weatherDetails: Weather) {
        router.openDetailWeatherModule(withWeatherDetails: weatherDetails)
    }

    func gotWeatherForecast(cityObservable: Observable<String>) -> Observable<[Weather]> {
        return cityObservable
            .observeOn(MainScheduler.instance)
            .flatMapLatest(findForecast)
    }

    private func findForecast(city: String) -> Observable<[Weather]> {
        print(city)
        return self.interactor.findForecast(forCity: city)
    }
}
