//
//  WeatherCollectionViewCellViewModel.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 08/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class weatherForecastTableViewCellViewModel {
    
    // MARK: - Properties
    var cities = [Weather]()
//    var forecast
    
    // MARK: - Initialization
    init(cities: [Weather]) {
        self.cities = cities
    }
    
}
