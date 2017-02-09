//
//  WeatherService.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/8/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

protocol WeatherService {
    func obtainForecast(forCity city: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->())
}

class WeatherServiceImpl: WeatherService {

    private let baseUrl = "http://api.openweathermap.org/data/2.5/"
    private let appId = "958f9e2267b8baf4e51eef9a95303935"

    func obtainForecast(forCity city: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->()) {
        let parameters = ["q" : city, "APPID" : appId]
        let url = baseUrl + "forecast"
        Alamofire.request(url, parameters: parameters).responseObject { (response: DataResponse<WeatherResponse>) in
            completionHandler(response)
        }
    }
}
