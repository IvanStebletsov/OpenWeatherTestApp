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
    var dataSaverService: DataSaver!
    var addNewCityViewController: AddNewCityViewController!
    var editSavedCitiesViewController: EditSavedCitiesViewController!
    var cities = [Weather]()
    
    // MARK: - Initialization
    init(networkService: Networking, dataSaverService: DataSaverService) {
        self.networkService = networkService
        self.dataSaverService = dataSaverService
    }
    
    // MARK: - Methods
    func fetchData(completion: @escaping (() -> ())) {
        cities = []
        let citiesIds = dataSaverService.loadSavedCities()

        networkService.fetchWeatherDataFor(citiesIds) { [weak self] in
            guard let self = self else { return }
            for cityId in citiesIds {
                if let cityForecast = $0.first(where: { $0.city.id == cityId }) {
                    self.cities.append(cityForecast)
                }
            }
            completion()
        }
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
