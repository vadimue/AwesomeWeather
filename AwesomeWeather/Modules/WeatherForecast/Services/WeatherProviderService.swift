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
    var dataService: DataService!
    var weatherService: WeatherService!

    func findForecast(forCity city: String, completionHandler: @escaping ([Weather]) -> ()) {
        var weatherItems: [Weather]!
        let weatherDetails = fetchFromDatabase(forCity: city)
        if correctDataInStore(weatherDetails: weatherDetails) {
            weatherItems = map(weatherDetailsData: weatherDetails)
            completionHandler(weatherItems)
            return
        }
        dataService?.remove(entities: weatherDetails)
        weatherService.obtainForecast(forCity: city) { (response) in
            guard let weatherForecast = response.result.value else {
                return
            }
            self.saveToDatabase(weatherResponse: weatherForecast)
            completionHandler(self.map(weatherResponse: weatherForecast))
        }

    }

    private func fetchFromDatabase(forCity city: String) -> [WeatherDetailsData] {
        return dataService.fetchFiltered(with: "city", equalTo: city)
    }

    private func correctDataInStore(weatherDetails : [WeatherDetailsData]) -> Bool {
        if weatherDetails.count == 0 { return false }
        return !weatherDetails.contains { isLessThanDate(firstDate: $0.time!, dateToCompare: Date()) }
    }

    private func isLessThanDate(firstDate: NSDate, dateToCompare: Date) -> Bool {
        //Declare Variables
        var isLess = false

        //Compare Values
        if firstDate.compare(dateToCompare) == ComparisonResult.orderedAscending {
            isLess = true
        }

        //Return Result
        return isLess
    }

    private func map(weatherDetailsData: [WeatherDetailsData]) -> [Weather] {
        return weatherDetailsData.map({ (weatherDetailsItem) -> Weather in
            return Weather(desc: weatherDetailsItem.desc,
                           humidity: Int(weatherDetailsItem.humidity),
                           icon: weatherDetailsItem.icon,
                           main: weatherDetailsItem.main,
                           temp: weatherDetailsItem.temp,
                           time: weatherDetailsItem.time,
                           wind: weatherDetailsItem.wind)
        })
    }

    private func map(weatherResponse: WeatherResponse) -> [Weather] {
        return (weatherResponse.list?.map({ (weatherDetailsItem: WeatherDetails) -> Weather in
            return Weather(desc: weatherDetailsItem.weather?[0].description,
                           humidity: Int((weatherDetailsItem.main?.humidity)!),
                           icon: weatherDetailsItem.weather?[0].icon,
                           main: weatherDetailsItem.weather?[0].main,
                           temp: weatherDetailsItem.main?.temp,
                           time: Date(timeIntervalSince1970: TimeInterval(weatherDetailsItem.dt!)) as NSDate?,
                           wind: weatherDetailsItem.wind?.speed)
        }))!
    }

    private func saveToDatabase(weatherResponse: WeatherResponse) {
        weatherDataStoreService.saveWeatherResponse(weatherResponse: weatherResponse)
    }
}
