//
//  WeatherForecastTVCell.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 06/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class WeatherForecastTVCell: UITableViewCell {
    
    // MARK: - UI elements
    var timeLabel: UILabel!
    var weatherImageView: UIImageView!
    var minMaxTempStackView: UIStackView!
    var minTempLabel: UILabel!
    var maxTempLabel: UILabel!
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        makeWeekDayLabel()
        makeWeatherImageView()
        makeMinMaxTempStackView()
        makeMinMaxTempLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell method
    override func prepareForReuse() {
        timeLabel.text = ""
        minTempLabel.text = "--"
        maxTempLabel.text = "--"
    }
    
}
