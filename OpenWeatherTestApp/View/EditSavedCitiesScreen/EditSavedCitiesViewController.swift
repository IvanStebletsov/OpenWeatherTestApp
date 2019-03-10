//
//  EditSavedCitiesViewController.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 09/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class EditSavedCitiesViewController: UIViewController {
    
    // MARK: - Properties
    let cellId = "cellId"
    var editSavedCitiesViewModel: EditSavedCitiesViewModel!
    var delegate: WeatherViewCintrollerDelegate?
    
    // MARK: - UI elements
    var editSavedCitiesBackgroundView: UIView!
    var closeEditSavedCitiesVCButton: UIButton!
    var savedCitiesTableView: UITableView!
    
    // MARK: - Life cicle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeEditSavedCitiesBackgroundView()
        makeCloseEditSavedCitiesVCButton()
        makeSavedCitiesTableView()
    }
}
