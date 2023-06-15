//
//  EventDetailViewModel.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/30/23.
//

import Foundation

extension EventDetailView {
    class ViewModel: ObservableObject {
        enum State {
            case createMode
            case readMode(EventEntity)
            case editMode(EventEntity)
        }
        
        let state: State
        var eventEntity: EventEntity
        
        // Ideally, the state which is being used for permission check should be passed from the server or checked at view model to check if the user is authorized.
        // Instead of view passing 'readMode' or 'updateMode'
        init(state: State) {
            self.state = state

            switch state {
            case .createMode:
                fatalError("Not implemented Yet")
            case .editMode(let eventEntity), .readMode(let eventEntity):
                self.eventEntity = eventEntity
            }
        }

        func create() {

        }
        
        func update() {
            
        }
        
        func delete() {
            
        }
    }

}
