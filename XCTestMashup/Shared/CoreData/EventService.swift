//
//  EventService.swift
//  XCTestMashup
//
//  Created by Justin Lee on 7/4/23.
//

import Foundation
import CoreData

final class EventService {
    let persistentStore: PersistentStore
    var viewContext: NSManagedObjectContext { persistentStore.viewContext }
    
    init(persistentStore: PersistentStore) {
        self.persistentStore = persistentStore
    }
    
    @discardableResult
    func add(name: String, detail: String) -> EventEntity {
        let event = EventEntity(context: viewContext)
        event.id = UUID()
        event.name = name
        event.detail = detail
        
        persistentStore.saveContext()
        return event
    }
    
    func getEvents() -> [EventEntity]? {
        let eventFetchRequest = EventEntity.fetchRequest()
        do {
            return try viewContext.fetch(eventFetchRequest)
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
        return nil
    }
    
    @discardableResult
    func update(_ event: EventEntity) -> EventEntity {
        persistentStore.saveContext()
        return event
    }
    
    func delete(_ event: EventEntity) {
        viewContext.delete(event)
        persistentStore.saveContext()
    }
}
