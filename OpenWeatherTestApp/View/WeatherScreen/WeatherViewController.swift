//
//  WeatherViewController.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 05/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    // MARK: - Properties
    let cellId = "cellId"
    var weatherViewModel = WeatherViewModel()
    
    // MARK: - UI elements
    var buttomView: UIView!
    var addNewCityButton: UIButton!
    var swipeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeButtomView()
        makeAddNewCityButton()
        makeSwipeCollectionView()
    }
}

