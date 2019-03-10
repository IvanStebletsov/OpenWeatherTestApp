//
//  AddNewCityVCExtension.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 08/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension AddNewCityViewController: AddNewCityViewModelDelegate {
    
    // MARK: - UI Configuration
    func makeSearchResultsTableView() {
        searchResultsTableView = UITableView()
        searchResultsTableView.translatesAutoresizingMaskIntoConstraints = false
        searchResultsTableView.separatorStyle = .none
        searchResultsTableView.backgroundColor = .clear
        searchResultsTableView.keyboardDismissMode = .interactive
        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
        
        addNewCityBackgroundView.addSubview(searchResultsTableView)
        
        searchResultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        let searchResultsTableViewConstraints = [
            searchResultsTableView.topAnchor.constraint(equalTo: citySearchBar.bottomAnchor),
            searchResultsTableView.bottomAnchor.constraint(equalTo: addNewCityBackgroundView.bottomAnchor, constant: -20),
            searchResultsTableView.leadingAnchor.constraint(equalTo: addNewCityBackgroundView.leadingAnchor),
            searchResultsTableView.trailingAnchor.constraint(equalTo: addNewCityBackgroundView.trailingAnchor)]
        NSLayoutConstraint.activate(searchResultsTableViewConstraints)
    }
    
    func makeAddNewCityBackgroundView() {
        addNewCityBackgroundView = UIView()
        addNewCityBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addNewCityBackgroundView.backgroundColor = UIColor.init(white: 1, alpha: 0.9)
        addNewCityBackgroundView.layer.cornerRadius = 25
        
        view.addSubview(addNewCityBackgroundView)
        
        let addNewCityBackgroundViewConstraints = [
            addNewCityBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addNewCityBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addNewCityBackgroundView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.8),
            addNewCityBackgroundView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9)]
        NSLayoutConstraint.activate(addNewCityBackgroundViewConstraints)
    }
    
    func makeCloseAddNewCityVCButton() {
        closeAddNewCityVCButton = UIButton()
        closeAddNewCityVCButton.translatesAutoresizingMaskIntoConstraints = false
        
        closeAddNewCityVCButton.alpha = 0.5
        
        closeAddNewCityVCButton.addTarget(self, action: #selector(unwindAddNewCityViewController), for: .touchUpInside)
        
        view.addSubview(closeAddNewCityVCButton)
        
        let closeAddNewCityVCButtonConstraints = [
            closeAddNewCityVCButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            closeAddNewCityVCButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            closeAddNewCityVCButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03),
            closeAddNewCityVCButton.widthAnchor.constraint(equalTo: closeAddNewCityVCButton.heightAnchor)]
        NSLayoutConstraint.activate(closeAddNewCityVCButtonConstraints)
    }
    
    func makeCitySearchBar() {
        citySearchBar = UISearchBar()
        citySearchBar.translatesAutoresizingMaskIntoConstraints = false
        citySearchBar.barStyle = .blackTranslucent
        citySearchBar.searchBarStyle = .minimal
        citySearchBar.endEditing(true)
        citySearchBar.delegate = self
        
        if let textfield = citySearchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = .white
            
            if let backgroundview = textfield.subviews.first {
                
                backgroundview.backgroundColor = #colorLiteral(red: 0.5999328494, green: 0.6000387073, blue: 0.5999261737, alpha: 1)
                backgroundview.alpha = 0.5
                
                backgroundview.layer.cornerRadius = 10
                backgroundview.clipsToBounds = true
            }
        }
        
        view.addSubview(citySearchBar)
        
        let citySearchBarConstraints = [
            citySearchBar.topAnchor.constraint(equalTo: addNewCityBackgroundView.topAnchor, constant: 5),
            citySearchBar.leadingAnchor.constraint(equalTo: addNewCityBackgroundView.leadingAnchor),
            citySearchBar.trailingAnchor.constraint(equalTo: addNewCityBackgroundView.trailingAnchor)]
        NSLayoutConstraint.activate(citySearchBarConstraints)
    }
    
    func makeActivityIndicator() {
        activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.startAnimating()
        
        view.addSubview(activityIndicatorView)
        
        let activityIndicatorViewConstraints = [
            activityIndicatorView.centerYAnchor.constraint(equalTo: citySearchBar.centerYAnchor),
            activityIndicatorView.trailingAnchor.constraint(equalTo: citySearchBar.trailingAnchor, constant: -40)]
        NSLayoutConstraint.activate(activityIndicatorViewConstraints)
    }
    
    // MARK: - AlertController creation
    func showAddNewCityAlertController(city: CityData) {
        let alertController = UIAlertController(title: "Добавить новый город", message: "Добавить город \(city.cityName), \(city.country.country) для отслеживания погоды?", preferredStyle: .alert)
        
        let addNewAlertAction = UIAlertAction(title: "Добавить", style: .default) { [unowned self] (_) in
            let currentCities = self.addNewCityViewModel.dataSaverService.loadSavedCities()
            var newCitiesIds = currentCities
            newCitiesIds.append(city.cityId)
            self.addNewCityViewModel.dataSaverService.saveCities(newCitiesIds)
            self.unwindAddNewCityVCAndReloadData()
        }
        
        let cancelAlertAction = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        
        alertController.addAction(addNewAlertAction)
        alertController.addAction(cancelAlertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showErrorAlertController(_ error: Error) {
        let alertController = UIAlertController(title: "Oops, something went wrong: /", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "ОК", style: .default) { [unowned self] (_) in
            self.unwindAddNewCityViewController()
        }
        alertController.addAction(okAlertAction)
        
        DispatchQueue.main.async { [unowned self] in
            self.present(alertController, animated: true, completion: nil)
            self.activityIndicatorView.isHidden = true
        }
    }
    
    // MARK: - Dismiss keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Transition method
    func unwindAddNewCityVCAndReloadData() {
        unwindAddNewCityViewController()
        delegate?.reloadView()
    }
    
    @objc func unwindAddNewCityViewController() {
        self.dismiss(animated: true, completion: nil)
    }
}
