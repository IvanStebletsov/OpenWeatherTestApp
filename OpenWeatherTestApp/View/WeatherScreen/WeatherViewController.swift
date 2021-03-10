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
    var weatherViewModel: WeatherViewModel!
    
    // MARK: - UI elements
    var buttomView: UIView!
    var activityIndicatorBackgroundView: UIView!
    var activityIndicatorView: UIActivityIndicatorView!
    var copyright: UIImageView!
    var addNewCityButton: UIButton!
    var refreshWeatherDataButton: UIButton!
    var swipeCollectionView: UICollectionView!
    var noDataForDisplayImageView: UIImageView!
    var someTroubleDescriptionLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Life cicle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        makeButtomView()
        makeCopyrightImage()
        makeAddNewCityButton()
        makeNoDataForDisplayImageView()
        makeSwipeCollectionView()
        makeRefreshActivityIndicator()
        addGestureRecognizer()
        reloadView()
    }
}
