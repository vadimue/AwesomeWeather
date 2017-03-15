//
//  WeatherForecastWeatherForecastViewOutput.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import RxSwift

protocol WeatherForecastViewOutput {

    /**
        @author Vadim Brusko
        Notify presenter that view is ready
    */

    func viewIsReady()
    func gotWeatherForecast(cityObservable: Observable<String>) -> Observable<[Weather]>
    func didSelectRow(withWeatherDetails weatherDetails: Weather)
}
