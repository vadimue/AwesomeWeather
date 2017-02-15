//
//  WeatherDataStoreService.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/15/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import SugarRecord

protocol WeatherDataStoreService {
    func saveWeatherResponse(weatherResponse: WeatherResponse)
    func fetch() -> [WeatherDetailsData]
}

class WeatherDataStoreServiceImpl: WeatherDataStoreService {

    var dataService: DataService!

    func saveWeatherResponse(weatherResponse: WeatherResponse) {
        guard let weatherResponseItems = weatherResponse.list else { return }
        saveWeatherDetails(weatherResponse: weatherResponseItems)
        //dataService.insert(entities: weatherDataItems)
    }

    func fetch() -> [WeatherDetailsData] {
        return dataService.fetch()
    }

    private func saveWeatherDetails(weatherResponse: [WeatherDetails]) {
        try! dataService.coreDataStorage.operation { (context, save) -> Void in
            for weatherDetails in weatherResponse {
                self.createWeatherData(fromContext: context, withWeatherDetails: weatherDetails)
            }
            save()
        }
    }

    private func createWeatherData(fromContext context: Context, withWeatherDetails weatherDetails: WeatherDetails) {
        let weatherData: WeatherDetailsData = try! context.create()
        weatherData.desc = weatherDetails.weather?[0].description
        weatherData.humidity = Int32((weatherDetails.main?.humidity)!)
        weatherData.icon = weatherDetails.weather?[0].icon
        weatherData.main = weatherDetails.weather?[0].main
        weatherData.temp = (weatherDetails.main?.temp)!
        weatherData.time = Date(timeIntervalSince1970: TimeInterval(weatherDetails.dt!)) as NSDate?
        weatherData.wind = (weatherDetails.wind?.speed)!
    }
}
