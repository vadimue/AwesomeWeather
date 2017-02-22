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
    var mockWeatherMapper: MockWeatherMapper!
    var mockWeatherDataStoreService: MockWeatherDataStoreService!
    var moc: NSManagedObjectContext!

    let correctWeatherJson: String = "{\"city\": { \"name\": \"Shuzenji\", \"list\": [{ \"dt\": 1406106000, \"main\": { \"temp\": 298.77, \"humidity\": 87 }, \"weather\": [ { \"id\": 804, \"main\": \"Clouds\", \"description\": \"overcast clouds\", \"icon\": \"04d\" } ], \"wind\": { \"speed\": 5.71 } } ] } }"

    override func setUp() {
        super.setUp()
        mockWeatherService = MockWeatherService()
        mockWeatherMapper = MockWeatherMapper()
        mockWeatherDataStoreService = MockWeatherDataStoreService()
        service = WeatherProviderServiceImpl()
        service.weatherService = mockWeatherService
        service.weatherMapper = mockWeatherMapper
        service.weatherDataStoreService = mockWeatherDataStoreService
        moc = CoreDataHelpers.setUpInMemoryManagedObjectContext()
    }

    func test_FindForecast_CorrectDataInStore_ResultsFromStore() {

        // given
        mockFetchFiltered(withReturn: createCorrectWeatherDetailsData())

        // when
        var result: [Weather]?
        service.findForecast(forCity: "") { result = $0 }

        // then
        XCTAssertEqual(result?.count, 1)
    }


    func test_FindForecast_IncorrectDataInStore_ResultFromWeatherService() {

        // given
        mockAllForIncorrectDataInStore()

        // when
        var result: [Weather]?
        service.findForecast(forCity: "") { result = $0 }

        // then
        XCTAssertNotNil(result)
    }

    func test_FindForecast_IncorrectDataInStore_RemoveOutdateWeather() {

        // given
        mockAllForIncorrectDataInStore()

        // when
        service.findForecast(forCity: "") {_ in}

        // then
        verify(mockWeatherDataStoreService).remove(entities: any())
    }

    func test_FindForecast_ObtainedForecastFromWeb_SavedToDatabase() {

        // given
        mockAllForIncorrectDataInStore()

        // when
        service.findForecast(forCity: "") {_ in}

        // then
        verify(mockWeatherDataStoreService).saveWeatherResponse(weatherResponse: any())
    }

    private func createCorrectWeatherDetailsData() -> [WeatherDetailsData] {
        return createWeatherDetailsData(withTimeInterval: TimeInterval(1000000))
    }

    private func createIncorrectWeatherDetailsData() -> [WeatherDetailsData] {
        return createWeatherDetailsData(withTimeInterval: TimeInterval(-1000000))
    }

    private func createWeatherDetailsData(withTimeInterval interval: TimeInterval) -> [WeatherDetailsData] {
        let weather = NSEntityDescription.insertNewObject(forEntityName: "WeatherDetailsData", into: moc) as! WeatherDetailsData
        weather.time = NSDate().addingTimeInterval(interval)
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

    private func mockAllForIncorrectDataInStore() {
        mockFetchFiltered(withReturn: createIncorrectWeatherDetailsData())
        mockObtainForecast(withResponse: createSuccessResponse())
        mockSaveWeatherResponse()
        mockRemove()
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

    private func mockFetchFiltered(withReturn: [WeatherDetailsData]) {
        stub(mockWeatherDataStoreService) { (mock) in
            mock.fetchFiltered(with: anyString(), equalTo: anyString())
                .thenReturn(withReturn)
        }
    }

    private func mockRemove() {
        stub(mockWeatherDataStoreService) { (mock) in
            mock.remove(entities: any()).thenDoNothing()
        }
    }
}
