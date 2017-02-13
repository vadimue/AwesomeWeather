//
//  DetailWeatherAssembly.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/13/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Swinject

class DetailWeatherAssembly: Assembly {

    //Module assembly
    func assemble(container: Container) {
        container.register(DetailWeatherInteractor.self) { (r, presenter: DetailWeatherPresenter) in
            let interactor = DetailWeatherInteractor()
            interactor.output = presenter

            return interactor
        }

        container.register(DetailWeatherRouter.self) { (r, viewController: DetailWeatherViewController) in
            DetailWeatherRouter()
        }

        container.register(DetailWeatherPresenter.self) { (r, viewController: DetailWeatherViewController) in
            let presenter = DetailWeatherPresenter()
            presenter.view = viewController
            presenter.interactor = r.resolve(DetailWeatherInteractor.self, argument: presenter)
            presenter.router = r.resolve(DetailWeatherRouter.self, argument: viewController)

            return presenter
        }

        container.storyboardInitCompleted(DetailWeatherViewController.self) { r, viewController in
            viewController.output = r.resolve(DetailWeatherPresenter.self, argument: viewController)
        }
    }
    
}
