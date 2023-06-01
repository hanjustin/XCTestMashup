//
//  EventListViewModel.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/30/23.
//

import Foundation

extension EventListView {
    @MainActor class ViewModel: ObservableObject {
        let events = [Event(id: UUID(), name: "Event1"), Event(id: UUID(), name: "Event2")]
    }

}

