//
//  WeatherResponse.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/9/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import ObjectMapper

struct WeatherResponse: Mappable {

    public var cod : Int?
    public var message : Double?
    public var cnt : Int?
    public var list : Array<WeatherDetails>?
    public var city : City?

    init?(map: Map) {

    }

    /// This function is where all variable mappings should occur. It is executed by Mapper during the mapping (serialization and deserialization) process.
    public mutating func mapping(map: Map) {
        cod <- map["cod"]
        message <- map["message"]
        cnt <- map["cnt"]
        list <- map["list"]
        city <- map["city"]
    }
}
