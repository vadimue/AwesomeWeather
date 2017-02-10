//
//  DetailWeatherDetailWeatherInitializer.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 10/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import UIKit

class DetailWeatherModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var detailweatherViewController: DetailWeatherViewController!

    override func awakeFromNib() {

        let configurator = DetailWeatherModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: detailweatherViewController)
    }

}
