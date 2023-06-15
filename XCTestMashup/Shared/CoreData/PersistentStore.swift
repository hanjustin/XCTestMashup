//
//  PersistentStore.swift
//  XCTestMashup
//
//  Created by Justin Lee on 6/14/23.
//

import CoreData

struct PersistentStore {
    static var preview: PersistentStore = {
        let result = PersistentStore(inMemory: true)
        result.createPreviewMocks()
        result.saveContext()
        return result
    }()
    
    let container: NSPersistentContainer
    var viewContext: NSManagedObjectContext { container.viewContext }
    
    init(inMemory: Bool = false) {
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
    
    private func createPreviewMocks() {
        for i in 0..<10 {
            let event = EventEntity(context: viewContext)
            event.id = UUID()
            event.name = "Name\(i)"
            event.detail = "Detail\(i)"
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

// MARK: - Xcode Previews Content
extension PersistentStore {
    static func getTestEventEntity() -> EventEntity? {
        let fetchRequest = EventEntity.fetchRequest()
        fetchRequest.fetchLimit = 1
        return try? preview.viewContext.fetch(fetchRequest).first
    }
}
