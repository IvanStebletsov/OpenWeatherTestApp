//
//  CoreDataStorage.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 06/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStorage {
    
    // MARK: - Properties
    private let modelName: String
    
    // MARK: - Initialization
    init(modelName: String) {
        self.modelName = modelName
    }
    
    // MARK: - CoreDataStack
    private lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: modelName)
        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                print("ERROR: \(error), \(error.userInfo)")
            }
        }
        return persistentContainer
    }()
    
    // MARK: - Managed Object Contexts
    private lazy var privateManagedObjectContext: NSManagedObjectContext = {
        // Initialization of PrivateManagedObjectContext for background operations
        let privateManagedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        
        // Tied our PrivateManagedObjectContext with PersistentStoreCoordinator
        privateManagedObjectContext.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        
        return privateManagedObjectContext
    }()
    
    lazy var mainManagedObjectContext: NSManagedObjectContext = {
        // Initialization of MainManagedObjectContext like child context of PrivateManagedObjectContext for operations assotiated with UI
        let mainManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        // Specify that our MainManagedObjectContext is a child of the PrivateManagedObjectContext
        mainManagedObjectContext.parent = self.privateManagedObjectContext
        
        return mainManagedObjectContext
    }()
    
    // MARK: - Helpers
    func saveChanges() {
        // Check context on changes and push the changes to the parent PrivateManagedObjectContext
        mainManagedObjectContext.performAndWait {
            do {
                if self.mainManagedObjectContext.hasChanges {
                    try self.mainManagedObjectContext.save()
                }
            } catch let error as NSError {
                print("ERROR: \(error): \(error.userInfo)")
            }
        }
        
        // Check context on changes and push the changes to the PersistentStore
        privateManagedObjectContext.perform {
            do {
                if self.privateManagedObjectContext.hasChanges {
                    try self.privateManagedObjectContext.save()
                }
            } catch let error as NSError {
                print("ERROR: \(error): \(error.userInfo)")
            }
        }
    }
    
}
