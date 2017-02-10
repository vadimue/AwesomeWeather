//
//  WeatherForecastWeatherForecastViewController.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import UIKit

class WeatherForecastViewController: UIViewController, WeatherForecastViewInput, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    var output: WeatherForecastViewOutput!

    @IBOutlet weak var tableView: UITableView!

    var weatherForecast: [WeatherDetails]?

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: WeatherForecastViewInput
    func setupInitialState() {
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherForecast?.count ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherForecastCell", for: indexPath) as! WeatherForecastTableViewCell
        configure(cell: cell, forIndex: indexPath.row)
        return cell
    }

    private func configure(cell: WeatherForecastTableViewCell, forIndex index: Int) {
        guard let weatherDetails = weatherForecast?[index] else {
            return
        }
        let date = Date(timeIntervalSince1970: TimeInterval(weatherDetails.dt!))
        cell.dayOfWeekLabel.text = String(describing: date)
        cell.weatherDescriptionLabel.text = weatherDetails.weather?[0].main!
        cell.tempLabel.text = String(describing: weatherDetails.main!.temp!)
        cell.windLabel.text = String(describing: weatherDetails.wind!.speed!)
        cell.weatherIcon.image = UIImage(named: "\(weatherDetails.weather![0].icon!).png")
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        output.findForecast(forText: searchBar.text)
    }

    func showWeatherForecast(_ forecast: [WeatherDetails]) {
        weatherForecast = forecast
        tableView.reloadData()
    }

    func changeTitle(_ title: String) {
        self.title = title
    }
}
