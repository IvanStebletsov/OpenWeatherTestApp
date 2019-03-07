//
//  WeatherByDayTableViewCell.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 06/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class WeatherByDayTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    
    // MARK: - UI elements
    var weakDayLabel: UILabel!
    var weatherImageView: UIImageView!
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        makeWeekDayLabel()
        makeWeatherImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configuration
    func makeWeekDayLabel() {
        weakDayLabel = UILabel()
        weakDayLabel.translatesAutoresizingMaskIntoConstraints = false
        weakDayLabel.textColor = .white
        
        self.addSubview(weakDayLabel)
        
        let weekDayLabelConstraints = [
            weakDayLabel.topAnchor.constraint(equalTo: topAnchor),
            weakDayLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            weakDayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)]
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
    
}
