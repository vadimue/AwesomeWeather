//
//  WeatherDataStoreService.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/15/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation

protocol WeatherDataStoreService {
    func saveWeatherResponse(weatherResponse: WeatherResponse)
    func remove(entities: [WeatherDetailsData])
    func fetchFiltered(with: String, equalTo: String) -> [WeatherDetailsData]
}

class WeatherDataStoreServiceImpl: WeatherDataStoreService {

    var dataService: DataService!
    var weatherMapper: WeatherMappable!
    var city: String?

    func saveWeatherResponse(weatherResponse: WeatherResponse) {
        guard let weatherResponseItems = weatherResponse.list else { return }
        city = weatherResponse.city?.name
        saveWeatherDetails(weatherResponse: weatherResponseItems)
    }

    func remove(entities: [WeatherDetailsData]) {
        return dataService.remove(entities: entities)
    }

    private func saveWeatherDetails(weatherResponse: [WeatherDetails]) {
        let weatherDataDetails = weatherMapper.mapToCoreDataObjects(fromWeatherDetails: weatherResponse,
                                                                    withWeatherCreator: dataService.create,
                                                                    withCity: city!)
        dataService.insert(entities: weatherDataDetails)
    }

    internal func fetchFiltered(with: String, equalTo: String) -> [WeatherDetailsData] {
        return dataService.fetchFiltered(with: with, equalTo: equalTo)
    }
}
