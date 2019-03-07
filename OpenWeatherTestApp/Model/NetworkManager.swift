//
//  NetworkManager.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 06/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol Networking {
    func fetchWeatherDataFor(cities: [Int])
}

class NetworkManager: Networking {
    let baseUrl = "http://api.openweathermap.org/data/2.5/forecast/"
    
    let citiesIds = [524901, 703448, 2643743]
    
    var requestQuerys = ["id": "524901",
                         "mode": "json",
                         "units": "metric",
                         "lang": "ru",
                         "cnt": "7",
                         "appid": "f79387bb4c9edb9e4a0cc4cd88f96b68"]
    
    func fetchWeatherDataFor(cities: [Int]) {
        citiesIds.forEach {
            requestQuerys["id"] = String($0)
            guard let url = baseUrl.createUrl(forRequestWith: requestQuerys) else { return }
            
            let urlSession = URLSession()
            urlSession.dataTask(with: url, completionHandler: { (data, response, error) in
                guard let data = data else { return }
                
            })
        }
    }
}
