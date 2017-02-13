//
//  DetailWeatherDetailWeatherModuleInput.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 10/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

protocol DetailWeatherModuleInput: class {
    func configureWith(weatherDetails: WeatherDetails)
}
