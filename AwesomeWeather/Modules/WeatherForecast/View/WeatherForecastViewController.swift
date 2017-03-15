//
//  WeatherForecastWeatherForecastViewController.swift
//  Awesome Weather
//
//  Created by Vadim Brusko on 08/02/2017.
//  Copyright © 2017 Ciklum. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WeatherForecastViewController: UIViewController, WeatherForecastViewInput {

    var output: WeatherForecastViewOutput!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    private let disposeBag = DisposeBag()

    var latestCity: Observable<String> {
        return searchBar
            .rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setupRx()
    }

    func setupRx() {

        let weatherObservable = output
            .gotWeatherForecast(cityObservable: latestCity)
            .shareReplay(1)

        weatherObservable.bindTo(
            tableView.rx.items(cellIdentifier: "WeatherForecastCell", cellType: WeatherForecastTableViewCell.self))
                { self.configure($0, $1, $2) }
                .disposed(by: disposeBag)

        tableView.rx.modelSelected(Weather.self)
            .subscribe ( onNext: { (weather) in
                self.output.didSelectRow(withWeatherDetails: weather)
            })
            .disposed(by: disposeBag)
    }


    // MARK: WeatherForecastViewInput
    func setupInitialState() {

    }

    private func configure(_ row: Int, _ weatherDetails: Weather, _ cell: WeatherForecastTableViewCell) {
        let date = weatherDetails.time!
        cell.dayOfWeekLabel.text = date != nil ? String(describing: date) : "None"
        cell.weatherDescriptionLabel.text = weatherDetails.desc!
        cell.tempLabel.text = String(describing: weatherDetails.temp!)
        cell.windLabel.text = String(describing: weatherDetails.wind!)
        let icon = weatherDetails.icon != nil ? UIImage(named: "\(weatherDetails.icon!).png") : nil
        cell.weatherIcon.image = icon!
    }

    func changeTitle(_ title: String) {
        self.title = title
    }
}

