//
//  List.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/9/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import ObjectMapper

struct WeatherDetails : Mappable {
    
    public var dt : Int?
    public var main : Main?
    public var weather : Array<WeatherDescription>?
    public var clouds : Clouds?
    public var wind : Wind?
    public var rain : Rain?
    public var dt_txt : String?

    init?(map: Map) {

    }

    public mutating func mapping(map: Map) {
        dt <- map["dt"]
        main <- map["main"]
        weather <- map["weather"]
        clouds <- map["clouds"]
        wind <- map["wind"]
        rain <- map["rain"]
        dt_txt <- map["dt_txt"]
    }
}
