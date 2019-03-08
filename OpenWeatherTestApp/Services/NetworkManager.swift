//
//  NetworkManager.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 06/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol Networking {
    func fetchWeatherDataFor(_ citiesIds: [Int], completion: @escaping (([Weather]) -> ()))
}

class NetworkManager: Networking {
    let baseUrl = "https://api.openweathermap.org/data/2.5/forecast/"
    
    var requestQuerys = ["id": "",
                         "mode": "json",
                         "units": "metric",
                         "lang": "en",
                         "cnt": "16",
                         "appid": "f79387bb4c9edb9e4a0cc4cd88f96b68"]
    
    func fetchWeatherDataFor(_ citiesIds: [Int], completion: @escaping (([Weather]) -> ())) {
        
        var weatherData = [Weather]()
        
        citiesIds.forEach {
            requestQuerys["id"] = String($0)
            guard let url = baseUrl.createUrl(forRequestWith: requestQuerys) else { return }
            
            print(url)
            
            let urlSession = URLSession.shared
            
            urlSession.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error { print("Error: \(error.localizedDescription)") }
                
                guard let data = data else { return }
                guard let weather = try? JSONDecoder().decode(Weather.self, from: data) else { return }
                
                weatherData.append(weather)
                
                completion(weatherData)
                
            }).resume()
        }
    }
}
