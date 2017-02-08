//
//  WeatherForecastWeatherForecastInitializer.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import UIKit

class WeatherForecastModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var weatherforecastViewController: WeatherForecastViewController!

    override func awakeFromNib() {

        let configurator = WeatherForecastModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: weatherforecastViewController)
    }

}
