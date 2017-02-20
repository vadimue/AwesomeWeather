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
import ObjectMapper
@testable import AwesomeWeather

class WeatherProviderServiceTests: XCTestCase {

    var service: WeatherProviderServiceImpl!
    var mockWeatherService: MockWeatherService!
    var mockDataService: MockDataService!
    var mockWeatherDataStoreService: MockWeatherDataStoreService!
    var moc: NSManagedObjectContext!

    let correctWeatherJson: String = "{\"city\": { \"name\": \"Shuzenji\", \"list\": [{ \"dt\": 1406106000, \"main\": { \"temp\": 298.77, \"humidity\": 87 }, \"weather\": [ { \"id\": 804, \"main\": \"Clouds\", \"description\": \"overcast clouds\", \"icon\": \"04d\" } ], \"wind\": { \"speed\": 5.71 } } ] } }"

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
        mockObtainForecast(withResponse: createSuccessResponse())
        mockSaveWeatherResponse()

        // when
        var result: [Weather]?
        service.findForecast(forCity: "") { result = $0 }

        // then
        XCTAssertNotNil(result)
    }

    func test_FindForecast_IncorrectDataInStore_RemoveOutdateWeather() {

        // given
        mockObtainForecast(withResponse: createSuccessResponse())
        mockSaveWeatherResponse()

        // when
        service.findForecast(forCity: "") {_ in}

        // then
        XCTAssert(mockDataService.removeWasCalled)
    }

    func test_FindForecast_ObtainedForecastFromWeb_SavedToDatabase() {

        // given
        let weatherResponse = createSuccessResponse()
        mockObtainForecast(withResponse: weatherResponse)
        mockSaveWeatherResponse()

        // when
        service.findForecast(forCity: "") {_ in}

        // then
        verify(mockWeatherDataStoreService).saveWeatherResponse(weatherResponse: any())
    }

    private func createCorrectWeatherDetailsData() -> [WeatherDetailsData] {
        let weather = NSEntityDescription.insertNewObject(forEntityName: "WeatherDetailsData", into: moc) as! WeatherDetailsData
        let timeInterval = TimeInterval(1000000)
        weather.time = NSDate().addingTimeInterval(timeInterval)
        var array: [WeatherDetailsData] = []
        array.append(weather)
        return array
    }

    private func createSuccessResponse() -> DataResponse<WeatherResponse> {
        let weather = Mapper<WeatherResponse>().map(JSONString: correctWeatherJson)
        let weatherResult = Result<WeatherResponse>.success(weather!)
        let weatherResponse = DataResponse<WeatherResponse>(request: nil, response: nil, data: nil, result: weatherResult)
        return weatherResponse
    }

    private func mockObtainForecast(withResponse response: DataResponse<WeatherResponse>) {
        stub(mockWeatherService) { (mock) in
            mock.obtainForecast(forCity: anyString(), completionHandler: anyClosure())
                .then({ $0.1(response)})
        }
    }

    private func mockSaveWeatherResponse() {
        stub(mockWeatherDataStoreService) { (mock) in
            mock.saveWeatherResponse(weatherResponse: any()).thenDoNothing()
        }
    }

    private func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
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
