//
//  WeatherVCExtension.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 05/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension WeatherViewController: WeatherViewModelDelegate {
    
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
        addNewCityButton.addTarget(self, action: #selector(reloadCollectionView), for: .touchUpInside)
        
        buttomView.addSubview(addNewCityButton)
        
        let addNewCityButtonConstraints = [
            addNewCityButton.centerYAnchor.constraint(equalTo: buttomView.centerYAnchor),
            addNewCityButton.trailingAnchor.constraint(equalTo: buttomView.trailingAnchor, constant: -10),
            addNewCityButton.heightAnchor.constraint(equalTo: buttomView.heightAnchor, multiplier: 0.8),
            addNewCityButton.widthAnchor.constraint(equalTo: addNewCityButton.heightAnchor)]
        NSLayoutConstraint.activate(addNewCityButtonConstraints)
    }
    
    func makeSwipeCollectionView() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        swipeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        swipeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        swipeCollectionView.backgroundColor = .clear
        swipeCollectionView.isPagingEnabled = true
        swipeCollectionView.showsHorizontalScrollIndicator = false
        
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
    
    // MARK: - Transition method
    @objc func reloadCollectionView() {
        swipeCollectionView.reloadData()
    }
    
    // MARK: - ViewModel Delegate method
    func reloadView() {
        swipeCollectionView.reloadData()
    }
    
}
