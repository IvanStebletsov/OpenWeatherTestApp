//
//  WeatherByDayTableViewProtocols.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 06/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension CityCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WeatherByDayTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.weakDayLabel.text = "Понедельник"
        case 1:
            cell.weakDayLabel.text = "Вторник"
        case 2:
            cell.weakDayLabel.text = "Среда"
        case 3:
            cell.weakDayLabel.text = "Четверг"
        case 4:
            cell.weakDayLabel.text = "Пятница"
        case 5:
            cell.weakDayLabel.text = "Суббота"
        default:
            cell.weakDayLabel.text = "Воскресенье"
        }
        
        return cell
    }
    
    
}
