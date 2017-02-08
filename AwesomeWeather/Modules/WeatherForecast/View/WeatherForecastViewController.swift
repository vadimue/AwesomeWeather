//
//  WeatherForecastWeatherForecastViewController.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import UIKit

class WeatherForecastViewController: UIViewController, WeatherForecastViewInput, UITableViewDataSource, UITableViewDelegate {

    var output: WeatherForecastViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: WeatherForecastViewInput
    func setupInitialState() {
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "WeatherForecastCell", for: indexPath)
    }
    

}
