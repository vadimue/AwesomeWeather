//
//  Coord.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/9/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import ObjectMapper

struct Coord : Mappable {
    
    public var lat : Double?
    public var lon : Double?

    init?(map: Map) {

    }

    public mutating func mapping(map: Map) {
        lat <- map["lat"]
        lon <- map["lon"]
    }
}
