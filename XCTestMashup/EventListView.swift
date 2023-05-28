//
//  EventListView.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/26/23.
//

import SwiftUI

struct Event: Identifiable, Hashable {
    var id: UUID
    var name: String
}

struct EventListView: View {
    @State private var showingDetail = false
    let events = [Event(id: UUID(), name: "Event1"), Event(id: UUID(), name: "Event2")]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(events) { event in
                    NavigationLink(value: event) {
                        EventRow(title: event.name, subTitle: "\(event.id)")
                    }
                }
            }
            .navigationTitle("My Events")
            .toolbar {
                addEventButton
            }
            .navigationDestination(for: Event.self) { event in
                EventDetailView(event: event)
            }
            .sheet(isPresented: $showingDetail) {
                NavigationStack {
                    EventDetailView(showLeftButton: true)
                }
            }
        }
    }
    
    var addEventButton: some View {
        Button("Add Event") {
            showingDetail = true
        }
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
