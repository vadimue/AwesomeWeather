//
//  WeatherForecastAssembly.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/13/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Swinject

class WeatherForecastAssembly: Assembly {

    //Module assembly
    func assemble(container: Container) {
        container.register(WeatherForecastInteractor.self) { (r, presenter: WeatherForecastPresenter) in
            let interactor = WeatherForecastInteractor()
            interactor.output = presenter
            interactor.weatherService = r.resolve(WeatherService.self)
            return interactor
        }

        container.register(WeatherForecastRouter.self) { (r, viewController: WeatherForecastViewController) in
            let router = WeatherForecastRouter()
            router.transitionHandler = viewController

            return router
        }

        container.register(WeatherForecastPresenter.self) { (r, viewController: WeatherForecastViewController) in
            let presenter = WeatherForecastPresenter()
            presenter.view = viewController
            presenter.interactor = r.resolve(WeatherForecastInteractor.self, argument: presenter)
            presenter.router = r.resolve(WeatherForecastRouter.self, argument: viewController)

            return presenter
        }

        container.storyboardInitCompleted(WeatherForecastViewController.self) { (r, viewController) in
            viewController.output = r.resolve(WeatherForecastPresenter.self, argument: viewController)
        }
    }
    
}

