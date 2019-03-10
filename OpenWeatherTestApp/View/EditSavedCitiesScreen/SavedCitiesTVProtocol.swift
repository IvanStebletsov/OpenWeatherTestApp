//
//  SavedCitiesTVProtocol.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 09/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension EditSavedCitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editSavedCitiesViewModel.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let cityInfo = editSavedCitiesViewModel.cities[indexPath.row]
        
        cell.backgroundColor = .clear
        cell.textLabel?.text = "\(cityInfo.city.name), \(cityInfo.city.country)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let cityForDelete = editSavedCitiesViewModel.cities[indexPath.row]
            let savedCitieas = editSavedCitiesViewModel.dataSaverService.loadSavedCities()
            let newCitiesIds = savedCitieas.filter() { $0 != cityForDelete.city.id }
            
            editSavedCitiesViewModel.dataSaverService.saveCities(newCitiesIds)
            editSavedCitiesViewModel.cities.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .automatic)

            unwindEditSavedCitiesVCAndReloadData()
            delegate?.deleteSavedCity(at: indexPath)
        }
    }
}
