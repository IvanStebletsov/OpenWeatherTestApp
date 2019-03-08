//
//  WeatherViewModel.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 05/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol WeatherViewModelDelegate {
    func reloadView()
}

class WeatherViewModel {
    
    // MARK: - Properties
    var networkManager: Networking!
    var delegate: WeatherViewModelDelegate?
    var citiesIds = [524901,703448,2643743]
    var cities = [Weather]() {
        didSet {  DispatchQueue.main.async { self.delegate?.reloadView() } }
    }
    
    // MARK: - Initialization
    init(networkManager: Networking) {
        self.networkManager = networkManager
    }
    
    // MARK: - Properties
    func fetchData() {
        networkManager.fetchWeatherDataFor(citiesIds) { [unowned self] in self.cities = $0 }
    }
}
