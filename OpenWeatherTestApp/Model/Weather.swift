//
//  Weather.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 07/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

struct Weather: Codable {
    var statusCode: String
    var weatherForecastOnDay: [WeatherForecastOnDay]
    var city: CityDescription
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "cod"
        case weatherForecastOnDay = "list"
        case city
    }
}

struct WeatherForecastOnDay: Codable {
    var temperature: TemperatureData
    var weatherDescription: [WeatherDescription]
    var date: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "main"
        case weatherDescription = "weather"
        case date = "dt"
    }
}

struct TemperatureData: Codable {
    var current: Double
    var min: Double
    var max: Double
    
    enum CodingKeys: String, CodingKey {
        case current = "temp"
        case min = "temp_min"
        case max = "temp_max"
    }
}

struct WeatherDescription: Codable {
    var short: String
    var full: String
    var icon: String
    
    enum CodingKeys: String, CodingKey {
        case short = "main"
        case full = "description"
        case icon
    }
}

struct CityDescription: Codable {
    var id: Int
    var name: String
    var country: String
}
