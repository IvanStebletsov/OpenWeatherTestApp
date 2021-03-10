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
    func fetchCityDataFor(_ cityName: String, completion: @escaping (([City]?, Error?) -> ()))
}

class NetworkService: Networking {
    
    // MARK: - Properties
    let baseUrl = "https://api.openweathermap.org/data/2.5/forecast/"
    let baseUrlForFind = "https://api.openweathermap.org/data/2.5/find"
    
    var requestQuerys = ["id": "",
                         "mode": "json",
                         "units": "metric",
                         "lang": "en",
                         "cnt": "16",
                         "appid": "f79387bb4c9edb9e4a0cc4cd88f96b68"]
    
    var findRequestQuerys = ["q": "",
                             "type": "like",
                             "appid": "f79387bb4c9edb9e4a0cc4cd88f96b68"]
    
    // MARK: - Methods
    func fetchWeatherDataFor(_ citiesIds: [Int], completion: @escaping (([Weather]) -> ())) {
        
        var weatherData = [Weather]()
        
        for city in citiesIds {
            requestQuerys["id"] = String(city)
            guard let url = baseUrl.createUrl(forRequestWith: requestQuerys) else { return }

            let urlSession = URLSession.shared
            
            urlSession.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error { print("Error: \(error.localizedDescription)") }
                
                guard let data = data else { return }
                guard let weather = try? JSONDecoder().decode(Weather.self, from: data) else { return }
                weatherData.append(weather)

                if weatherData.count == citiesIds.count {
                    completion(weatherData)
                }
            }).resume()
        }
    }
    
    func fetchCityDataFor(_ cityName: String, completion: @escaping (([City]?, Error?) -> ())) {
        var cityInfo = [City]()
        
        findRequestQuerys["q"] = cityName
        
        guard let url = baseUrlForFind.createUrl(forRequestWith: findRequestQuerys) else { return }
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil, error)
            }
            guard let data = data else { return }
            guard let city = try? JSONDecoder().decode(City.self, from: data) else { completion(cityInfo, nil); return }
            
            cityInfo.append(city)
            completion(cityInfo, error)
        }).resume()
    }
}
