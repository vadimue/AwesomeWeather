//
//  Wind.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/9/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import ObjectMapper

struct Wind : Mappable {
    
	public var speed : Double?
	public var deg : Double?

    init?(map: Map) {

    }

    public mutating func mapping(map: Map) {
        speed <- map["speed"]
        deg <- map["deg"]
    }
}
