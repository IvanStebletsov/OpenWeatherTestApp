//
//  EditSavedCitiesViewModel.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 09/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class EditSavedCitiesViewModel {
    
    // MARK: - Properties
    var networkService: Networking!
    var dataSaverService: DataSaver!
    var cities = [Weather]()
    
    // MARK: - Initialization
    init(networkService: Networking, dataSaverService: DataSaver) {
        self.networkService = networkService
        self.dataSaverService = dataSaverService
    }
    
    // MARK: - Methods
    func fetchDataForCity(_ cityName: String, completion: @escaping (() -> ())) {
        let savedCities = dataSaverService.loadSavedCities()
        networkService.fetchWeatherDataFor(savedCities) { [unowned self] in
            self.cities = $0
            completion()
        }
    }
}
