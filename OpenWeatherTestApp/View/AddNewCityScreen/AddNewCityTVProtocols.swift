//
//  AddNewCityTVProtocols.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 08/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension AddNewCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let searchResult = addNewCityViewModel.cityData.first
        guard let cities = searchResult?.cityData else { return 0 }
        
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let searchResult = addNewCityViewModel.cityData.first
        guard let cityInfo = searchResult?.cityData[indexPath.row] else { return cell }
        
        cell.backgroundColor = .clear
        cell.textLabel?.text = "\(cityInfo.cityName), \(cityInfo.country.country) (City id: \(cityInfo.cityId))"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let searchResult = addNewCityViewModel.cityData.first
        guard let cityInfo = searchResult?.cityData[indexPath.row] else { return }

        showAddNewCityAlertController(city: cityInfo)
    }
    
}
