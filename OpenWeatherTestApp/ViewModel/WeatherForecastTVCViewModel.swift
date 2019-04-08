//
//  WeatherForecastTVCViewModel.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 08/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class WeatherForecastTVCViewModel {
    
    // MARK: - Properties
    var forecast = [WeatherForecastOnDay]()
    
    // MARK: - Initialization
    init(forecast: [WeatherForecastOnDay]) {
        self.forecast = forecast
    }
    
}
