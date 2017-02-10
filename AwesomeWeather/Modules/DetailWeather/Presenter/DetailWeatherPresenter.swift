//
//  DetailWeatherDetailWeatherPresenter.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 10/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

class DetailWeatherPresenter: DetailWeatherModuleInput, DetailWeatherViewOutput, DetailWeatherInteractorOutput {

    weak var view: DetailWeatherViewInput!
    var interactor: DetailWeatherInteractorInput!
    var router: DetailWeatherRouterInput!

    func viewIsReady() {

    }
}
