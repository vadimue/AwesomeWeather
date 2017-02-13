//
//  DetailWeatherDetailWeatherViewController.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 10/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import UIKit

class DetailWeatherViewController: UIViewController, DetailWeatherViewInput {

    var output: DetailWeatherViewOutput!

    @IBOutlet weak var mainWeatherLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: DetailWeatherViewInput
    func setupInitialState(withWeatherDetails weatherDetails: WeatherDetails) {
        mainWeatherLabel.text = weatherDetails.weather![0].main!
        descriptionLabel.text = weatherDetails.weather![0].description!
        humidityLabel.text = String(weatherDetails.main!.humidity!)
    }
}
