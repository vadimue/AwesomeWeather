//
//  ServicesAssembly.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/14/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Swinject

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(WeatherService.self) { _ in WeatherServiceImpl() }
        container.register(DataService.self) { _ in DataServiceImpl() }
        container.register(WeatherMappable.self) { _ in WeatherMapperService() }
    }
}
