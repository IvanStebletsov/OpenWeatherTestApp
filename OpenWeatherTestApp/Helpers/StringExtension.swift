//
//  StringExtension.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 07/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

extension String {
    func createUrl(forRequestWith querys: [String: String]) -> URL? {
        guard let url = URL(string: self) else { return nil }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        urlComponents?.queryItems = querys.map { URLQueryItem(name: $0.key, value: $0.value) }
        return urlComponents?.url
    }
}
