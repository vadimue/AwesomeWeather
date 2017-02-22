//
//  WeatherProviderService.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/14/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import RxSwift

protocol WeatherProviderService {
    func findForecast(forCity city: String, completionHandler: @escaping ([Weather]) -> ())
    func findForecast(forCity city: String) -> Observable<[Weather]>
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

    func findForecast(forCity city: String) -> Observable<[Weather]> {


        let weatherObservable = Observable<[Weather]>.create { (weatherItems) -> Disposable in

            let weatherDetails = self.fetchFromDatabase(forCity: city)
            if self.correctDataInStore(weatherDetails: weatherDetails) {
                let dataStoreWeatherItems = self.weatherMapper.mapToPoso(fromWeatherDetailsData: weatherDetails)
                weatherItems.on(.next(dataStoreWeatherItems))
            }

            self.weatherService.obtainForecast(forCity: city) { (response) in
                guard let weatherForecast = response.result.value else {
                    return
                }
                self.removeOutdateWeather(weatherDetails: weatherDetails)
                self.saveToDatabase(weatherResponse: weatherForecast)
                let apiWeatherItems = self.weatherMapper.mapToPoso(fromWeatherResponse: weatherForecast)
                weatherItems.on(.next(apiWeatherItems))
                weatherItems.onCompleted()
            }
            return Disposables.create()
        }
        return weatherObservable
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
