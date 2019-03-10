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
    var delegate: WeatherCollectionViewCellDelegate?
    
    // MARK: - UI elements
    var buttomView: UIView!
    var copyright: UIImageView!
    var addNewCityButton: UIButton!
    var swipeCollectionView: UICollectionView!
    var noDataForDisplayImageView: UIImageView!
    var someTroubleDescriptionLabel: UILabel!
    
    // MARK: - Life cicle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeButtomView()
        makeCopyrightImage()
        makeAddNewCityButton()
        makeSwipeCollectionView()
        makeNoDataForDisplayImageView()
        
        weatherViewModel.fetchData() {
            DispatchQueue.main.async { [unowned self] in
                self.swipeCollectionView.reloadData()
                self.showHideNoDataForDisplayImageView()
            }
        }
    }
}
