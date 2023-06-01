//
//  EventDetailViewModel.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/30/23.
//

import Foundation

extension EventDetailView {
    @MainActor class ViewModel: ObservableObject {
        enum State {
            case createMode
            case readMode
            case updateMode
        }
        
        @Published var event: Event = .mock
        let state: State
        
        // Ideally, the state which is being used for permission check should be passed from the server or checked at view model
        // Instead of view passing 'readMode' or 'updateMode'
        init(state: State, _ event: Event = .mock) {
            self.state = state
            self.event = event
        }

        func create() {

        }
        
        func update() {
            
        }
        
        func delete() {
            
        }
    }

}
