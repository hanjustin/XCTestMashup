//
//  Event.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/30/23.
//

import Foundation

struct Event: Identifiable, Hashable {
    var id: UUID
    var name: String
    var description = ""
    
    static let mock = Event(id: UUID(), name: "")
}
