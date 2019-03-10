//
//  WeatherByDayTableViewCellExtension.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 07/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension WeatherForecastTVCell {
    
    // MARK: - UI Configuration
    func makeWeekDayLabel() {
        timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = .white
        
        self.addSubview(timeLabel)
        
        let weekDayLabelConstraints = [
            timeLabel.topAnchor.constraint(equalTo: topAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)]
        NSLayoutConstraint.activate(weekDayLabelConstraints)
        
    }
    
    func makeWeatherImageView() {
        weatherImageView = UIImageView()
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.image = UIImage(named: "02d")
        
        self.addSubview(weatherImageView)
        
        let weatherImageViewConstraints = [
            weatherImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            weatherImageView.widthAnchor.constraint(equalTo: weatherImageView.heightAnchor)]
        NSLayoutConstraint.activate(weatherImageViewConstraints)
    }
    
    func makeMinMaxTempStackView() {
        minMaxTempStackView = UIStackView()
        minMaxTempStackView.distribution = .fillEqually
        minMaxTempStackView.spacing = 20
        minMaxTempStackView.axis = .horizontal
        minMaxTempStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(minMaxTempStackView)
        
        let minMaxTempStackViewConstraints = [
            minMaxTempStackView.topAnchor.constraint(equalTo: topAnchor),
            minMaxTempStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            minMaxTempStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            minMaxTempStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2)]
        NSLayoutConstraint.activate(minMaxTempStackViewConstraints)
    }
    
    func makeMinMaxTempLabels() {
        minTempLabel = UILabel()
        minTempLabel.textColor = .white
        minTempLabel.textAlignment = .right
        minTempLabel.text = "--"
        
        minMaxTempStackView.addArrangedSubview(minTempLabel)
        
        maxTempLabel = UILabel()
        maxTempLabel.textColor = .white
        maxTempLabel.textAlignment = .right
        maxTempLabel.text = "--"
        
        minMaxTempStackView.addArrangedSubview(maxTempLabel)
    }
}
