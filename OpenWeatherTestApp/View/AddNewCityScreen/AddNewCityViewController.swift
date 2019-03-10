//
//  AddNewCityViewController.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 08/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class AddNewCityViewController: UIViewController {
    
    // MARK: - Properties
    let cellId = "cellId"
    var addNewCityViewModel: AddNewCityViewModel!
    var delegate: WeatherViewCintrollerDelegate?
    
    // MARK: - UI elements
    var addNewCityBackgroundView: UIView!
    var closeAddNewCityVCButton: UIButton!
    var citySearchBar: UISearchBar!
    var searchResultsTableView: UITableView!
    var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - Life cicle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewCityViewModel.delegate = self
        
        makeAddNewCityBackgroundView()
        makeCloseAddNewCityVCButton()
        makeCitySearchBar()
        makeSearchResultsTableView()
    }
}
