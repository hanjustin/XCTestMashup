//
//  EventListViewModel.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/30/23.
//

import Foundation
import CoreData

extension EventListView {
    @MainActor class ViewModel: NSObject, ObservableObject {
        @Published var events: [EventEntity] = []
        private let fetchResultsController: NSFetchedResultsController<EventEntity>
        private let persistentStore: PersistentStore
        
        init(persistentStore: PersistentStore = .shared) {
            let fetchRequest = EventEntity.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            self.persistentStore = persistentStore
            self.fetchResultsController = NSFetchedResultsController(
                                                fetchRequest: fetchRequest,
                                                managedObjectContext: persistentStore.viewContext,
                                                sectionNameKeyPath: nil,
                                                cacheName: nil)

            super.init()

            fetchResultsController.delegate = self
            performInitialFetch()
        }
        
        private func performInitialFetch() {
            do {
                try fetchResultsController.performFetch()
                guard let eventEntities = fetchResultsController.fetchedObjects else { return }
                events = eventEntities
            } catch {
                fatalError("Failed to fetch entities: \(error)")
            }
        }
    }
}

extension EventListView.ViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let eventEntities = controller.fetchedObjects as? [EventEntity] else { return }
        events = eventEntities
    }
}
