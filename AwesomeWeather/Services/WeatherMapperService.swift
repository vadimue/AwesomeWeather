//
//  WeatherMapperService.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/20/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation

protocol WeatherMappable {
    func mapToPoso(fromWeatherDetailsData weatherDetailsData: [WeatherDetailsData]) -> [Weather]
    func mapToPoso(fromWeatherResponse weatherResponse: WeatherResponse) -> [Weather]
    func mapToWeatherDetailsData(fromWeatherDetails weatherDetails: [WeatherDetails],
                                 withWeatherCreator create: () -> WeatherDetailsData,
                                 withCity city: String) -> [WeatherDetailsData]
}

struct WeatherMapperService : WeatherMappable {
    func mapToPoso(fromWeatherDetailsData weatherDetailsData: [WeatherDetailsData]) -> [Weather] {
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

    func mapToPoso(fromWeatherResponse weatherResponse: WeatherResponse) -> [Weather] {
        guard weatherResponse.list != nil else {
            return [Weather]()
        }
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

    func mapToWeatherDetailsData(fromWeatherDetails weatherDetails: [WeatherDetails],
                                 withWeatherCreator create: () -> WeatherDetailsData,
                                 withCity city: String) -> [WeatherDetailsData] {
        return weatherDetails.map { weatherDetailsItem in
            let weatherData: WeatherDetailsData = create()
            weatherData.desc = weatherDetailsItem.weather?[0].description
            weatherData.humidity = Int32((weatherDetailsItem.main?.humidity)!)
            weatherData.icon = weatherDetailsItem.weather?[0].icon
            weatherData.main = weatherDetailsItem.weather?[0].main
            weatherData.temp = (weatherDetailsItem.main?.temp)!
            weatherData.time = Date(timeIntervalSince1970: TimeInterval(weatherDetailsItem.dt!)) as NSDate?
            weatherData.wind = (weatherDetailsItem.wind?.speed)!
            weatherData.city = city
            return weatherData
        }
    }
    
}
