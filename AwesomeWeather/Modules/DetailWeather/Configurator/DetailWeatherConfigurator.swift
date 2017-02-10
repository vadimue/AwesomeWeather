//
//  DetailWeatherDetailWeatherConfigurator.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 10/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import UIKit

class DetailWeatherModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DetailWeatherViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DetailWeatherViewController) {

        let router = DetailWeatherRouter()

        let presenter = DetailWeatherPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DetailWeatherInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
