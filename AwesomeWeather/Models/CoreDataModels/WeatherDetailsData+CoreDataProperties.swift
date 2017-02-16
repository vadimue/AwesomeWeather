//
//  WeatherDetailsData+CoreDataProperties.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/16/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import CoreData


extension WeatherDetailsData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherDetailsData> {
        return NSFetchRequest<WeatherDetailsData>(entityName: "WeatherDetailsData");
    }

    @NSManaged public var desc: String?
    @NSManaged public var humidity: Int32
    @NSManaged public var icon: String?
    @NSManaged public var main: String?
    @NSManaged public var temp: Double
    @NSManaged public var time: NSDate?
    @NSManaged public var wind: Double
    @NSManaged public var city: String?

}
