//
//  EditSavedCitiesVCExtension.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 09/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension EditSavedCitiesViewController {
    
    // MARK: - UI Configuration
    func makeSavedCitiesTableView() {
        savedCitiesTableView = UITableView()
        savedCitiesTableView.translatesAutoresizingMaskIntoConstraints = false
        savedCitiesTableView.separatorStyle = .none
        savedCitiesTableView.backgroundColor = .clear
        savedCitiesTableView.keyboardDismissMode = .interactive
        savedCitiesTableView.delegate = self
        savedCitiesTableView.dataSource = self
        
        editSavedCitiesBackgroundView.addSubview(savedCitiesTableView)
        
        savedCitiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        let searchResultsTableViewConstraints = [
            savedCitiesTableView.topAnchor.constraint(equalTo: editSavedCitiesBackgroundView.topAnchor, constant: 20),
            savedCitiesTableView.bottomAnchor.constraint(equalTo: editSavedCitiesBackgroundView.bottomAnchor, constant: -20),
            savedCitiesTableView.leadingAnchor.constraint(equalTo: editSavedCitiesBackgroundView.leadingAnchor),
            savedCitiesTableView.trailingAnchor.constraint(equalTo: editSavedCitiesBackgroundView.trailingAnchor)]
        NSLayoutConstraint.activate(searchResultsTableViewConstraints)
    }
    
    func makeEditSavedCitiesBackgroundView() {
        editSavedCitiesBackgroundView = UIView()
        editSavedCitiesBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        editSavedCitiesBackgroundView.backgroundColor = UIColor.init(white: 1, alpha: 0.9)
        editSavedCitiesBackgroundView.layer.cornerRadius = 25
        
        view.addSubview(editSavedCitiesBackgroundView)
        
        let addNewCityBackgroundViewConstraints = [
            editSavedCitiesBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editSavedCitiesBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            editSavedCitiesBackgroundView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.8),
            editSavedCitiesBackgroundView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9)]
        NSLayoutConstraint.activate(addNewCityBackgroundViewConstraints)
    }
    
    func makeCloseEditSavedCitiesVCButton() {
        closeEditSavedCitiesVCButton = UIButton()
        closeEditSavedCitiesVCButton.translatesAutoresizingMaskIntoConstraints = false
        
        closeEditSavedCitiesVCButton.alpha = 0.5
        
        closeEditSavedCitiesVCButton.addTarget(self, action: #selector(unwindEditSavedCitiesViewController), for: .touchUpInside)
        
        view.addSubview(closeEditSavedCitiesVCButton)
        
        let closeAddNewCityVCButtonConstraints = [
            closeEditSavedCitiesVCButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            closeEditSavedCitiesVCButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            closeEditSavedCitiesVCButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03),
            closeEditSavedCitiesVCButton.widthAnchor.constraint(equalTo: closeEditSavedCitiesVCButton.heightAnchor)]
        NSLayoutConstraint.activate(closeAddNewCityVCButtonConstraints)
    }
    
    // MARK: - Transition method
    func unwindEditSavedCitiesVCAndReloadData() {
        unwindEditSavedCitiesViewController()
        delegate?.reloadView()
    }
    
    @objc func unwindEditSavedCitiesViewController() {
        self.dismiss(animated: true, completion: nil)
    }
}
