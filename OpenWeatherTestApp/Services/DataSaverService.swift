//
//  DataSaverService.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 09/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class DataSaverService {
 
    
    
    
    // MARK: - UserDefaults methods
    // This methods for working with predefined cities and with available network connection
    func saveCities(_ cities: [Int]) {
        UserDefaults.standard.set(cities, forKey: "SavedCities")
    }
    
    func loadSavedCities() -> [Int] {
        return UserDefaults.standard.array(forKey: "SavedCities") as? [Int] ?? [Int]()
    }
    
    func loadPredefinedCities() -> [Int] {
        let cities = UserDefaults.standard.array(forKey: "PredefinedCities") as? [Int] ?? [Int]()
        return cities
    }
    
    func savePredefinedCities() {
        let predefinedCities = [524901,498817]
        UserDefaults.standard.set(predefinedCities, forKey: "PredefinedCities")
        saveCities(predefinedCities)
    }
}
