//
//  Rain.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/9/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import ObjectMapper

struct Rain : Mappable {
    
    public var threeH : Double?

    init?(map: Map) {

    }

    public mutating func mapping(map: Map) {
        threeH <- map["3h"]
    }
}
