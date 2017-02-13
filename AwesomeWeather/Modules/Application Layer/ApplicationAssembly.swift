//
//  ApplicationAssembly.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/13/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class ApplicationAssembly {

    //Use default dependency
    class var assembler: Assembler {
        return try! Assembler(assemblies: [
            WeatherForecastAssembly(),
            DetailWeatherAssembly()
            ])
    }

    var assembler: Assembler

    //If you want use custom Assembler
    init(with assemblies: [Assembly]) {
        assembler = try! Assembler(assemblies: assemblies)
    }

}

//Inject dependency in Main Storyboard
extension SwinjectStoryboard {

    public static func setup() {
        defaultContainer = ApplicationAssembly.assembler.resolver as! Container
    }
    
}

