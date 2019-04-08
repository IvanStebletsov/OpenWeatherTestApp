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
        performSearchrequest(with: searchText)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchRequestText = searchBar.text else { return }
        performSearchrequest(with: searchRequestText)
        searchBar.resignFirstResponder()
    }
    
    func performSearchrequest(with searchText: String) {
        pendingRequestWorkItem?.cancel()
        
        let requestWorkItem = DispatchWorkItem { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.activityIndicatorView.isHidden = false
            }
            
            self?.addNewCityViewModel.fetchDataForCity(searchText) {
                DispatchQueue.main.async { [weak self] in
                    self?.searchResultsTableView.reloadData()
                    self?.activityIndicatorView.isHidden = true
                }
            }
        }
        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: requestWorkItem)
    }
}
