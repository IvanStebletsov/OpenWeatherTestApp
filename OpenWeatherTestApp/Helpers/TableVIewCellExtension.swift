//
//  TableVIewCellExtension.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 08/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension WeatherForecastTVCell {
    func madeWithModelOf(_ forecast: weatherForecastOnDay) -> WeatherForecastTVCell {
        let weatherIcon = UIImage(named: forecast.weatherDescription.first!.icon)
        let minTemperature = String(format: "%.0f", forecast.temperature.min)
        let maxTemperature = String(format: "%.0f", forecast.temperature.max)
        
        self.timeLabel.text = forecast.date.formatted()
        self.weatherImageView.image = weatherIcon
        self.minTempLabel.text = minTemperature
        self.maxTempLabel.text = maxTemperature
        
        return self
    }
}
