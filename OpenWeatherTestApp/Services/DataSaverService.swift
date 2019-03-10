//
//  DataSaverService.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 09/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol DataSaver {
    
    
    func saveCities(_ cities: [Int])
    func loadSavedCities() -> [Int]
    func loadPredefinedCities() -> [Int]
    func savePredefinedCities()
}

class DataSaverService: DataSaver {
 
    var coreData: CoreDataStorage?
    
    func saveNew(name: String, price: String, stock: String) {
//        guard let coreDataManager = coreDataManager else { return }
//        let newItem = Item(context: coreDataManager.mainManagedObjectContext)
//        newItem.name = name
//        newItem.price = price
//        newItem.stock = stock
//        coreDataManager.saveChanges()
    }
    
    
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
