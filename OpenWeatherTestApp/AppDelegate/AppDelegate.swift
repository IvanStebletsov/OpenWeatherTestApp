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
    
    private let coreDataStorage = CoreDataStorage(modelName: "OpenWeatherTestApp")

    // MARK: - Application lifecicle methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.setGradientBackground(ColorOne: #colorLiteral(red: 0.1520375907, green: 0.5580861568, blue: 0.7331124544, alpha: 1), ColorTwo: #colorLiteral(red: 0.4053153396, green: 0.664766252, blue: 0.8025251031, alpha: 1))
        
        let weatherViewModel = WeatherViewModel(networkService: networkService, dataSaverService: dataSaverService)
        weatherViewModel.citiesIds = setupPredefinedCities()
        
        let weatherViewController = WeatherViewController()
        weatherViewController.weatherViewModel = weatherViewModel
        
        window?.rootViewController = weatherViewController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }
    
    
    // Setup predifined cities
    func setupPredefinedCities() -> [Int] {
        isCitiesPredefined = UserDefaults.standard.bool(forKey: "isCitiesPredefined")
        if !isCitiesPredefined {
            isCitiesPredefined = true
            UserDefaults.standard.set(isCitiesPredefined, forKey: "isCitiesPredefined")
            dataSaverService.savePredefinedCities()
            return dataSaverService.loadPredefinedCities()
        } else {
            return dataSaverService.loadSavedCities()
        }
    }
}
