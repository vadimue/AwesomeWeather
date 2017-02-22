//
//  WeatherProviderService.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/14/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation

protocol WeatherProviderService {
    func findForecast(forCity city: String, completionHandler: @escaping ([Weather]) -> ())
}

class WeatherProviderServiceImpl : WeatherProviderService {
    var weatherDataStoreService: WeatherDataStoreService!
    var weatherService: WeatherService!
    var weatherMapper: WeatherMappable!

    func findForecast(forCity city: String, completionHandler: @escaping ([Weather]) -> ()) {
    
        var weatherItems: [Weather]!
        let weatherDetails = fetchFromDatabase(forCity: city)
        if correctDataInStore(weatherDetails: weatherDetails) {
            weatherItems = weatherMapper.mapToPoso(fromWeatherDetailsData: weatherDetails)
            completionHandler(weatherItems)
            return
        }
        removeOutdateWeather(weatherDetails: weatherDetails)
        weatherService.obtainForecast(forCity: city) { (response) in
            guard let weatherForecast = response.result.value else {
                return
            }
            self.saveToDatabase(weatherResponse: weatherForecast)
            completionHandler(self.weatherMapper.mapToPoso(fromWeatherResponse: weatherForecast))
        }

    }

    private func fetchFromDatabase(forCity city: String) -> [WeatherDetailsData] {
        return weatherDataStoreService.fetchFiltered(with: "city", equalTo: city)
    }

    private func correctDataInStore(weatherDetails : [WeatherDetailsData]) -> Bool {
        if weatherDetails.count == 0 { return false }
        return !weatherDetails.contains { $0.time!.isLessThanDate(dateToCompare: Date()) }
    }

    private func saveToDatabase(weatherResponse: WeatherResponse) {
        weatherDataStoreService.saveWeatherResponse(weatherResponse: weatherResponse)
    }

    private func removeOutdateWeather(weatherDetails: [WeatherDetailsData]) {
        weatherDataStoreService.remove(entities: weatherDetails)
    }
}
