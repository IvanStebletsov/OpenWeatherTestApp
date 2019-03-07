//
//  CityCollectionViewCell.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 05/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    let cellId = "cellId"
    
    // MARK: - UI elements
    var weatherDataStackView: UIStackView!
    var todayWeakDayLable: UILabel!
    var weatherByDayTableView: UITableView!
    var cityNameLabel: UILabel!
    var weatherLabel: UILabel!
    var weatherDescriptionLabel: UILabel!
    var temperatureLabel: UILabel!
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeWeatherByDayTableView()
        makeSeparationTopLine()
        makeSeparationBottomLine()
        makeTodayWeakDayLabel()
        makeWeatherDataStackView()
        makeCityNameLable()
        makeWeatherLabel()
        makeWeatherDescriptionLabel()
        makeTemperatureLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configuration
    func makeWeatherDataStackView() {
        weatherDataStackView = UIStackView()
        weatherDataStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherDataStackView.axis = .vertical
        weatherDataStackView.alignment = .center
        weatherDataStackView.distribution = .fillProportionally
        
        self.addSubview(weatherDataStackView)
        
        let weatherDataStackViewConstraints = [
            weatherDataStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            weatherDataStackView.bottomAnchor.constraint(equalTo: todayWeakDayLable.topAnchor),
            weatherDataStackView.centerXAnchor.constraint(equalTo: centerXAnchor)]
        NSLayoutConstraint.activate(weatherDataStackViewConstraints)
    }
    
    func makeCityNameLable() {
        cityNameLabel = UILabel()
        cityNameLabel.font = .boldSystemFont(ofSize: 35)
        cityNameLabel.textColor = .white
        cityNameLabel.textAlignment = .center
        cityNameLabel.text = "Moscow"
        
        weatherDataStackView.addArrangedSubview(cityNameLabel)
    }
    
    func makeWeatherLabel() {
        weatherLabel = UILabel()
        weatherLabel.font = .systemFont(ofSize: 30)
        weatherLabel.textColor = .white
        weatherLabel.text = "Cloudy"
        
        weatherDataStackView.addArrangedSubview(weatherLabel)
    }
    
    func makeWeatherDescriptionLabel() {
        weatherDescriptionLabel = UILabel()
        weatherDescriptionLabel.font = .systemFont(ofSize: 20)
        weatherDescriptionLabel.textColor = .white
        weatherDescriptionLabel.text = "Sun and clouds"
        
        weatherDataStackView.addArrangedSubview(weatherDescriptionLabel)
    }
    
    func makeTemperatureLabel() {
        temperatureLabel = UILabel()
        temperatureLabel.font = .boldSystemFont(ofSize: 80)
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center
        temperatureLabel.text = "-10" + "°"
        
        weatherDataStackView.addArrangedSubview(temperatureLabel)
    }
    
    func makeTodayWeakDayLabel() {
        let todayLabel = UILabel()
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.textColor = .white
        todayLabel.text = "Today:"
        
        self.addSubview(todayLabel)
        
        let todayLabelConstraints = [
            todayLabel.bottomAnchor.constraint(equalTo: weatherByDayTableView.topAnchor, constant: -15),
            todayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)]
        NSLayoutConstraint.activate(todayLabelConstraints)
        
        todayWeakDayLable = UILabel()
        todayWeakDayLable.translatesAutoresizingMaskIntoConstraints = false
        todayWeakDayLable.textColor = .white
        todayWeakDayLable.text = "Monday"
        
        self.addSubview(todayWeakDayLable)
        
        let todayWeakDayLableConstraints = [
            todayWeakDayLable.bottomAnchor.constraint(equalTo: weatherByDayTableView.topAnchor, constant: -15),
            todayWeakDayLable.leadingAnchor.constraint(equalTo: todayLabel.trailingAnchor, constant: 10)]
        NSLayoutConstraint.activate(todayWeakDayLableConstraints)
    }
    
    func makeWeatherByDayTableView() {
        weatherByDayTableView = UITableView()
        weatherByDayTableView.translatesAutoresizingMaskIntoConstraints = false
        weatherByDayTableView.separatorStyle = .none
        weatherByDayTableView.isScrollEnabled = false
        weatherByDayTableView.backgroundColor = .clear
        weatherByDayTableView.allowsSelection = false
        
        self.addSubview(weatherByDayTableView)
        
        weatherByDayTableView.register(WeatherByDayTableViewCell.self, forCellReuseIdentifier: cellId)
        
        weatherByDayTableView.delegate = self
        weatherByDayTableView.dataSource = self
        
        let weatherByDayTableViewConstraints = [
            weatherByDayTableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            weatherByDayTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            weatherByDayTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherByDayTableView.trailingAnchor.constraint(equalTo: trailingAnchor)]
        NSLayoutConstraint.activate(weatherByDayTableViewConstraints)
    }
    
    func makeSeparationTopLine() {
        let separationTopLine = UIView()
        separationTopLine.backgroundColor = .white
        separationTopLine.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(separationTopLine)
        
        let separationTopLineConstraints = [
            separationTopLine.topAnchor.constraint(equalTo: weatherByDayTableView.topAnchor),
            separationTopLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            separationTopLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            separationTopLine.heightAnchor.constraint(equalToConstant: 1)]
        NSLayoutConstraint.activate(separationTopLineConstraints)
    }
    
    func makeSeparationBottomLine() {
        let separationBottomLine = UIView()
        separationBottomLine.backgroundColor = .white
        separationBottomLine.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(separationBottomLine)
        
        let separationBottomLineConstraints = [
            separationBottomLine.bottomAnchor.constraint(equalTo: weatherByDayTableView.bottomAnchor),
            separationBottomLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            separationBottomLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            separationBottomLine.heightAnchor.constraint(equalToConstant: 1)]
        NSLayoutConstraint.activate(separationBottomLineConstraints)
    }
}
