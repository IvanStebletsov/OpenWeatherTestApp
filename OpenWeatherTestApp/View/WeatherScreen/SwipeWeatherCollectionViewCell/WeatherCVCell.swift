//
//  WeatherCVCell.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 05/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class WeatherCVCell: UICollectionViewCell {
    
    // MARK: - Properties
    let cellId = "cellId"
    var weatherForecastTVCViewModel: WeatherForecastTVCViewModel!
    var weatherViewController: WeatherViewController!
    
    // MARK: - UI elements
    var weatherDataStackView: UIStackView!
    var infoLabel: UILabel!
    var minMaxTempStackView: UIStackView!
    var minTempLabel: UILabel!
    var maxTempLabel: UILabel!
    var weatherForecastTableView: UITableView!
    var cityNameLabel: UILabel!
    var weatherLabel: UILabel!
    var weatherDescriptionLabel: UILabel!
    var temperatureLabel: UILabel!
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeWeatherForecastTableView()
        makeSeparationTopLine()
        makeSeparationBottomLine()
        makeInfoLabel()
        makeMinMaxTempStackView()
        makeMinMaxTempLabels()
        makeWeatherDataStackView()
        makeCityNameLable()
        makeWeatherLabel()
        makeWeatherDescriptionLabel()
        makeTemperatureLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
