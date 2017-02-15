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

    var weatherForecast: [Weather]? {
        didSet {
            tableView.reloadData()
        }
    }

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
        let date = weatherDetails.time
        cell.dayOfWeekLabel.text = String(describing: date)
        cell.weatherDescriptionLabel.text = weatherDetails.desc
        cell.tempLabel.text = String(describing: weatherDetails.temp!)
        cell.windLabel.text = String(describing: weatherDetails.wind!)
        cell.weatherIcon.image = UIImage(named: "\(weatherDetails.icon!).png")
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        output.findForecast(forText: searchBar.text)
    }

    func showWeatherForecast(_ forecast: [Weather]) {
        weatherForecast = forecast
    }

    func changeTitle(_ title: String) {
        self.title = title
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectRow(withWeatherDetails: (weatherForecast?[indexPath.row])!)
    }
}
