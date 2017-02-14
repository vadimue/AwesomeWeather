//
//  Clouds.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/9/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import ObjectMapper

struct Clouds : Mappable {
    
    public var all : Int?

    init?(map: Map) {

    }

    public mutating func mapping(map: Map) {
        all <- map["all"]
    }
}
