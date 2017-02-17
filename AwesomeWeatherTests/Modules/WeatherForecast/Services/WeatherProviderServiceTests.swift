//
//  WeatherProviderServiceTests.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/17/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import XCTest
import Cuckoo
import Alamofire
import CoreData
@testable import AwesomeWeather

class WeatherProviderServiceTests: XCTestCase {

    var service: WeatherProviderServiceImpl!
    var mockWeatherService: MockWeatherService!
    var mockDataService: MockDataService!
    var mockWeatherDataStoreService: MockWeatherDataStoreService!
    var dataService: MockDataService!
    var moc: NSManagedObjectContext!

    override func setUp() {
        super.setUp()
        mockWeatherService = MockWeatherService()
        mockDataService = MockDataService()
        mockWeatherDataStoreService = MockWeatherDataStoreService()
        service = WeatherProviderServiceImpl()
        service.weatherService = mockWeatherService
        service.dataService = mockDataService
        service.weatherDataStoreService = mockWeatherDataStoreService
        moc = setUpInMemoryManagedObjectContext()
    }

    func test_FindForecast_CorrectDataInStore_ResultsFromStore() {

        // given
        mockDataService.array = createCorrectWeatherDetailsData()

        // when
        var result: [Weather]?
        service.findForecast(forCity: "") { result = $0 }

        // then
        XCTAssertEqual(result?.count, 1)
    }


    func test_FindForecast_IncorrectDataInStore_ResultFromWeatherService() {

        // given
        stub(mockWeatherService) { (mock) in
            mock.obtainForecast(forCity: anyString(), completionHandler: anyClosure())
                .then({ $0.1(self.createErrorResponse())})
        }

        // when
        var result: [Weather]?
        service.findForecast(forCity: "") { result = $0 }

        // then
        //XCTAssertNotNil(result)
    }

    private func createCorrectWeatherDetailsData() -> [WeatherDetailsData] {
        let weather = NSEntityDescription.insertNewObject(forEntityName: "WeatherDetailsData", into: moc) as! WeatherDetailsData
        let timeInterval = TimeInterval(1000000)
        weather.time = NSDate().addingTimeInterval(timeInterval)
        var array: [WeatherDetailsData] = []
        array.append(weather)
        return array
    }

    private func createErrorResponse() -> DataResponse<WeatherResponse> {
        let weatherResult = Result<WeatherResponse>.failure(MyError())
        let weatherResponse = DataResponse<WeatherResponse>(request: nil, response: nil, data: nil, result: weatherResult)
        return weatherResponse
    }

    class MyError: Error {

    }

    func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!

        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)

        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        } catch {
            print("Adding in-memory persistent store failed")
        }

        let managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
        return managedObjectContext
    }
}
