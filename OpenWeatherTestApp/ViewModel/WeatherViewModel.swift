//
//  WeatherViewModel.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 05/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class WeatherViewModel {
    
    // MARK: - Properties
    var networkService: Networking!
    var dataSaverService: DataSaverService!
    var addNewCityViewController: AddNewCityViewController!
    var editSavedCitiesViewController: EditSavedCitiesViewController!
    var citiesIds = [Int]()
    var cities = [Weather]()
    
    // MARK: - Initialization
    init(networkService: Networking, dataSaverService: DataSaverService) {
        self.networkService = networkService
        self.dataSaverService = dataSaverService
    }
    
    // MARK: - Methods
    func fetchData(completion: @escaping (() -> ())) {
        networkService.fetchWeatherDataFor(citiesIds) { [unowned self] in
            self.cities = $0
            completion()
        }
    }
    
    func checkForNewCities() {
        let newCities = dataSaverService.loadSavedCities()
        if citiesIds != newCities { citiesIds = newCities }
    }
    
    func initAddNewCityViewController() {
        addNewCityViewController = AddNewCityViewController()
        addNewCityViewController.addNewCityViewModel = AddNewCityViewModel(networkService: networkService, dataSaverService: dataSaverService)
        addNewCityViewController.modalPresentationStyle = .overCurrentContext
    }
    
    func initEditSavedCitiesViewController() {
        editSavedCitiesViewController = EditSavedCitiesViewController()
        editSavedCitiesViewController.editSavedCitiesViewModel = EditSavedCitiesViewModel(networkService: networkService, dataSaverService: dataSaverService)
        editSavedCitiesViewController.editSavedCitiesViewModel.cities = cities
        editSavedCitiesViewController.modalPresentationStyle = .overCurrentContext
    }
}
