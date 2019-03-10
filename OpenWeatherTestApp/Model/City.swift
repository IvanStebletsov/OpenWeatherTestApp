//
//  City.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 09/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

struct City: Codable {
    var statusCode: String
    var cityData: [CityData]
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "cod"
        case cityData = "list"
    }
}

struct CityData: Codable {
    var cityId: Int
    var cityName: String
    var country: Country
    
    enum CodingKeys: String, CodingKey {
        case cityId = "id"
        case cityName = "name"
        case country = "sys"
    }
}

struct Country: Codable {
    var country: String
}
