//
//  City.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/9/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import ObjectMapper

struct City : Mappable {
    
    public var id : Int?
    public var name : String?
    public var coord : Coord?
    public var country : String?

    init?(map: Map) {

    }

    public mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        coord <- map["coord"]
        country <- map["country"]
    }
}
