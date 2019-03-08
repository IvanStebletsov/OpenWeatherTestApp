//
//  IntExtension.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 08/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

extension Int {
    func formatted() -> String {
        let date = Date(timeInterval: TimeInterval(self), since: Date(timeIntervalSince1970: 0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d HH:mm"
        
        return dateFormatter.string(from: date)
    }
}
