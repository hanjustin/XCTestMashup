//
//  PersistentStore.swift
//  XCTestMashup
//
//  Created by Justin Lee on 6/14/23.
//

import CoreData

struct PersistentStore {
    static var shared = PersistentStore()
    static var testing: PersistentStore { .init(inMemory: true) }
    
    let container: NSPersistentContainer
    var viewContext: NSManagedObjectContext { container.viewContext }
    
    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "XCTestMashup")
        if inMemory {
          container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data \(error)")
            } else {
                print("Core Data loaded")
            }
        }
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func saveContext () {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch let error as NSError {
                NSLog("Unresolved error saving context: \(error), \(error.userInfo)")
            }
        }
    }
}
