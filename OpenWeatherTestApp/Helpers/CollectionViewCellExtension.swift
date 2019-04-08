//
//  CollectionViewCellExtension.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 08/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension WeatherCVCell {
    func madeWithModelOf(_ weather: Weather) -> WeatherCVCell {
        let temperature = String(format: "%.0f", weather.weatherForecastOnDay.first!.temperature.current)
        let minTemperature = String(format: "%.0f", weather.weatherForecastOnDay.first!.temperature.min)
        let maxTemperature = String(format: "%.0f", weather.weatherForecastOnDay.first!.temperature.max)

        self.cityNameLabel.text = weather.city.name
        self.weatherLabel.text = weather.weatherForecastOnDay.first?.weatherDescription.first?.short
        self.weatherDescriptionLabel.text = weather.weatherForecastOnDay.first?.weatherDescription.first?.full
        self.temperatureLabel.text = temperature + "°"
        
        self.minTempLabel.text = minTemperature
        self.maxTempLabel.text = maxTemperature
        
        self.weatherForecastTVCViewModel.forecast = weather.weatherForecastOnDay
        
        return self
    }
}
