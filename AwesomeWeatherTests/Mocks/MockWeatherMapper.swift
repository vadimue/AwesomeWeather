//
//  MockWeatherMapper.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/22/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import CoreData
@testable import AwesomeWeather

class MockWeatherMapper: WeatherMappable {
    func mapToPoso(fromWeatherDetailsData weatherDetailsData: [WeatherDetailsData]) -> [Weather] {
        return [createDefaultWeather()]
    }

    func mapToPoso(fromWeatherResponse weatherResponse: WeatherResponse) -> [Weather] {
        return [createDefaultWeather()]
    }

    func mapToCoreDataObjects(fromWeatherDetails weatherDetails: [WeatherDetails],
                              withWeatherCreator create: () -> WeatherDetailsData,
                              withCity city: String) -> [WeatherDetailsData] {
        let moc = CoreDataHelpers.setUpInMemoryManagedObjectContext()
        let weather = NSEntityDescription.insertNewObject(forEntityName: "WeatherDetailsData", into: moc) as! WeatherDetailsData
        return [weather]
    }

    private func createDefaultWeather() -> Weather {
        return Weather(desc: "", humidity: 0, icon: "", main: "", temp: 0, time: NSDate(), wind: 0)
    }
}
