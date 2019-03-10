//
//  AddNewCitySBProtocols.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 09/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension AddNewCityViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        makeActivityIndicator()
        activityIndicatorView.isHidden = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            activityIndicatorView.isHidden = false
            addNewCityViewModel.fetchDataForCity(searchText) {
                DispatchQueue.main.async { [unowned self] in
                    self.searchResultsTableView.reloadData()
                    self.activityIndicatorView.isHidden = true
                }
            }
        } else {
            searchResultsTableView.reloadData()
        }
    }
}
