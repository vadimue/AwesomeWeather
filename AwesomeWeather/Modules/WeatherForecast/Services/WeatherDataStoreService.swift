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
    func fetch() -> [WeatherDetailsData]
}

class WeatherDataStoreServiceImpl: WeatherDataStoreService {

    var dataService: DataService!

    func saveWeatherResponse(weatherResponse: WeatherResponse) {
        guard let weatherResponseItems = weatherResponse.list else { return }
        saveWeatherDetails(weatherResponse: weatherResponseItems)
    }

    func fetch() -> [WeatherDetailsData] {
        return dataService.fetch()
    }

    private func saveWeatherDetails(weatherResponse: [WeatherDetails]) {
        dataService.insert(entities: weatherResponse.map {createWeatherData(withWeatherDetails: $0)})
    }

    private func createWeatherData(withWeatherDetails weatherDetails: WeatherDetails) -> WeatherDetailsData {
        let weatherData: WeatherDetailsData = dataService.create()
        weatherData.desc = weatherDetails.weather?[0].description
        weatherData.humidity = Int32((weatherDetails.main?.humidity)!)
        weatherData.icon = weatherDetails.weather?[0].icon
        weatherData.main = weatherDetails.weather?[0].main
        weatherData.temp = (weatherDetails.main?.temp)!
        weatherData.time = Date(timeIntervalSince1970: TimeInterval(weatherDetails.dt!)) as NSDate?
        weatherData.wind = (weatherDetails.wind?.speed)!
        return weatherData
    }
}
