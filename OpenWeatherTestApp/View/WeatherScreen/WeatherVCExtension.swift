//
//  WeatherVCExtension.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 05/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

protocol WeatherViewCintrollerDelegate {
    func reloadView()
    func deleteSavedCity(at indexPath: IndexPath)
}

extension WeatherViewController: WeatherViewCintrollerDelegate {
    
    // MARK: - UI Configuration    
    func makeButtomView() {
        buttomView = UIView()
        buttomView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttomView)
        
        let buttomViewConstraints = [
            buttomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)]
        NSLayoutConstraint.activate(buttomViewConstraints)
    }
    
    func makeAddNewCityButton() {
        addNewCityButton = UIButton()
        guard let image = UIImage(named: "addNew") else { return }
        let addNewImage = image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        addNewCityButton.setImage(addNewImage, for: .normal)
        addNewCityButton.tintColor = .white
        addNewCityButton.translatesAutoresizingMaskIntoConstraints = false
        
        buttomView.addSubview(addNewCityButton)
        
        let addNewCityButtonConstraints = [
            addNewCityButton.centerYAnchor.constraint(equalTo: buttomView.centerYAnchor),
            addNewCityButton.trailingAnchor.constraint(equalTo: buttomView.trailingAnchor, constant: -10),
            addNewCityButton.heightAnchor.constraint(equalTo: buttomView.heightAnchor, multiplier: 0.8),
            addNewCityButton.widthAnchor.constraint(equalTo: addNewCityButton.heightAnchor)]
        NSLayoutConstraint.activate(addNewCityButtonConstraints)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showAddNewCityViewController))
        self.addNewCityButton.addGestureRecognizer(tapGestureRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showEditSavedCitiesViewController))
        self.addNewCityButton.addGestureRecognizer(longPressRecognizer)
    }
    
    func makeCopyrightImage() {
        copyright = UIImageView()
        guard let image = UIImage(named: "OpenWeatherMapLogo") else { return }
        let copyrightImage = image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        copyright.image = copyrightImage
        copyright.tintColor = .white
        copyright.alpha = 0.5
        copyright.translatesAutoresizingMaskIntoConstraints = false
        
        buttomView.addSubview(copyright)
        
        let copyrightConstraints = [
            copyright.centerYAnchor.constraint(equalTo: buttomView.centerYAnchor),
            copyright.centerXAnchor.constraint(equalTo: buttomView.centerXAnchor, constant: 10),
            copyright.widthAnchor.constraint(equalTo: buttomView.widthAnchor, multiplier: 0.3),
            copyright.heightAnchor.constraint(equalTo: copyright.widthAnchor, multiplier: 0.1)]
        NSLayoutConstraint.activate(copyrightConstraints)
    }
    
    func makeSwipeCollectionView() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        swipeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        swipeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        swipeCollectionView.backgroundColor = .clear
        swipeCollectionView.isPagingEnabled = true
        swipeCollectionView.showsHorizontalScrollIndicator = false
        swipeCollectionView.allowsSelection = false
        
        view.addSubview(swipeCollectionView)
        
        swipeCollectionView.register(WeatherCVCell.self, forCellWithReuseIdentifier: cellId)
        
        swipeCollectionView.delegate = self
        swipeCollectionView.dataSource = self
        
        let swipeCollectionViewConstraints = [
            swipeCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            swipeCollectionView.bottomAnchor.constraint(equalTo: buttomView.topAnchor),
            swipeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            swipeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)]
        NSLayoutConstraint.activate(swipeCollectionViewConstraints)
    }
    
    func makeNoDataForDisplayImageView() {
        noDataForDisplayImageView = UIImageView()
        noDataForDisplayImageView.translatesAutoresizingMaskIntoConstraints = false
        guard let image = UIImage(named: "sadCloud") else { return }
        let someTroubleIcon = image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        noDataForDisplayImageView.image = someTroubleIcon
        noDataForDisplayImageView.tintColor = .white
        noDataForDisplayImageView.alpha = 0.6
        noDataForDisplayImageView.isHidden = true
        
        view.addSubview(noDataForDisplayImageView)
        
        let noDataForDisplayImageViewConstraints = [
            noDataForDisplayImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            noDataForDisplayImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noDataForDisplayImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            noDataForDisplayImageView.heightAnchor.constraint(equalTo: noDataForDisplayImageView.widthAnchor, multiplier: 0.7)]
        NSLayoutConstraint.activate(noDataForDisplayImageViewConstraints)
        
        someTroubleDescriptionLabel = UILabel()
        someTroubleDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        someTroubleDescriptionLabel.font = .systemFont(ofSize: 22)
        someTroubleDescriptionLabel.textColor = .white
        someTroubleDescriptionLabel.textAlignment = .center
        someTroubleDescriptionLabel.numberOfLines = 0
        someTroubleDescriptionLabel.alpha = 0.6
        someTroubleDescriptionLabel.text = "Either we have problems with the Internet, or no city has been added to monitor the weather."
        someTroubleDescriptionLabel.isHidden = true
        
        view.addSubview(someTroubleDescriptionLabel)
        
        let someTroubleDescriptionLabelConstraints = [
            someTroubleDescriptionLabel.topAnchor.constraint(equalTo: noDataForDisplayImageView.bottomAnchor, constant: 10),
            someTroubleDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            someTroubleDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)]
        NSLayoutConstraint.activate(someTroubleDescriptionLabelConstraints)
    }
    
    func showHideNoDataForDisplayImageView() {
        if self.weatherViewModel.cities.count == 0 {
            self.noDataForDisplayImageView.isHidden = false
            self.someTroubleDescriptionLabel.isHidden = false
        } else {
            self.noDataForDisplayImageView.isHidden = true
            self.someTroubleDescriptionLabel.isHidden = true
        }
    }
    
    // MARK: - Protocol methods
    func reloadView() {
        weatherViewModel.checkForNewCities()
        
        weatherViewModel.fetchData() {
            DispatchQueue.main.async { [unowned self] in
                self.swipeCollectionView.reloadData()
                self.showHideNoDataForDisplayImageView()
                self.delegate?.reloadView()
            }
        }
    }
    
    func deleteSavedCity(at indexPath: IndexPath) {
        weatherViewModel.cities.remove(at: indexPath.row)
        DispatchQueue.main.async { [unowned self] in
            self.swipeCollectionView.reloadData()
            self.showHideNoDataForDisplayImageView()
            self.delegate?.reloadView()
        }
    }
    
    // MARK: - Transition method
    @objc func showAddNewCityViewController() {
        weatherViewModel.initAddNewCityViewController()
        weatherViewModel.addNewCityViewController.delegate = self
        self.present(weatherViewModel.addNewCityViewController, animated: true, completion: nil)
    }
    
    
    @objc func showEditSavedCitiesViewController() {
        weatherViewModel.initEditSavedCitiesViewController()
        weatherViewModel.editSavedCitiesViewController.delegate = self
        self.present(weatherViewModel.editSavedCitiesViewController, animated: true, completion: nil)
    }
    
}
