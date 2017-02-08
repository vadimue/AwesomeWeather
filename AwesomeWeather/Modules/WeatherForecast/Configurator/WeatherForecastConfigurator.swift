//
//  WeatherForecastWeatherForecastConfigurator.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import UIKit

class WeatherForecastModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? WeatherForecastViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: WeatherForecastViewController) {

        let router = WeatherForecastRouter()

        let presenter = WeatherForecastPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = WeatherForecastInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
