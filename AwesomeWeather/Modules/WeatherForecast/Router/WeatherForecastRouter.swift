//
//  WeatherForecastWeatherForecastRouter.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import ViperMcFlurry

class WeatherForecastRouter: NSObject, WeatherForecastRouterInput {

    let toDetailWeatherSegue = "toDetailWeather"

    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!

    func openDetailWeatherModule(withWeatherDetails data: Weather) {
        transitionHandler.openModule!(usingSegue: toDetailWeatherSegue).thenChain { moduleInput in
            guard let detailWeatherModuleInput = moduleInput as? DetailWeatherModuleInput else { fatalError("invalid module type") }
            detailWeatherModuleInput.configureWith(weather: data)

            return nil
        }
    }
}
