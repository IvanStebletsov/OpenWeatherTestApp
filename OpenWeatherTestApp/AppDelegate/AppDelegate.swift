//
//  AppDelegate.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 05/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Properties
    var window: UIWindow?
    var isCitiesPredefined = false
    private let networkService = NetworkService()
    private let dataSaverService = DataSaverService()


    // MARK: - Application lifecicle methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.setGradientBackground(ColorOne: #colorLiteral(red: 0.1520375907, green: 0.5580861568, blue: 0.7331124544, alpha: 1), ColorTwo: #colorLiteral(red: 0.4053153396, green: 0.664766252, blue: 0.8025251031, alpha: 1))
        makeCloudsOnBackground()
        
        let weatherViewModel = WeatherViewModel(networkService: networkService, dataSaverService: dataSaverService)
        setupPredefinedCities()
        
        let weatherViewController = WeatherViewController()
        weatherViewController.weatherViewModel = weatherViewModel
        
        window?.rootViewController = weatherViewController
        
        return true
    }

    
    // Setup predifined cities
    func setupPredefinedCities() {
        isCitiesPredefined = UserDefaults.standard.bool(forKey: "isCitiesPredefined")
        if !isCitiesPredefined {
            isCitiesPredefined = true
            UserDefaults.standard.set(isCitiesPredefined, forKey: "isCitiesPredefined")
            dataSaverService.savePredefinedCities()
        }
    }
    
    func makeCloudsOnBackground() {
        let bigCloudImageView = UIImageView(frame: CGRect(x: window!.frame.width / 2, y: 0, width: 350, height: 207))
        bigCloudImageView.image = UIImage(named: "cloud1")
        window?.addSubview(bigCloudImageView)
        
        UIView.animate(withDuration: 180,
                       delay: 0,
                       options: [.autoreverse, .repeat],
                       animations: { [unowned self] in
                        bigCloudImageView.frame.origin.x -= ((self.window!.frame.width / 2) + bigCloudImageView.frame.width) })
        
        
        let smallCloudImageView = UIImageView(frame: CGRect(x: window!.frame.width / 2, y: 0, width: 270, height: 146))
        smallCloudImageView.image = UIImage(named: "cloud2")
        window?.addSubview(smallCloudImageView)
        
        UIView.animate(withDuration: 120,
                       delay: 0,
                       options: [.autoreverse, .repeat],
                       animations: { [unowned self] in
                        smallCloudImageView.frame.origin.x -= ((self.window!.frame.width / 2) + smallCloudImageView.frame.width) })
    }
}
