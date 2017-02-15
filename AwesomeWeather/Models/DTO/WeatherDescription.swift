//
//  Weather.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/9/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import ObjectMapper

struct WeatherDescription : Mappable {
    
    public var id : Int?
    public var main : String?
    public var description : String?
    public var icon : String?

    init?(map: Map) {

    }

    public mutating func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
}
