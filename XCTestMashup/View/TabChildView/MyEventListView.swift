//
//  MyEventListView.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/27/23.
//

import SwiftUI

struct MyEventListView: View {
    @State private var showingCreateEventDetail = false

    var body: some View {
        NavigationStack {
            EventListView(viewmodel: .init())
            .navigationTitle("My Events")
            .toolbar {
                addEventButton
            }
            .navigationDestination(for: Event.self) { event in
                EventDetailView(viewModel: .init(state: .updateMode, event))
            }
            .navigationDestination(isPresented: $showingCreateEventDetail) {
                EventDetailView(viewModel: .init(state: .createMode))
            }
        }
    }
    
    var addEventButton: some View {
        Button {
            showingCreateEventDetail = true
        } label: {
            Image(systemName: "plus")
        }
    }

}

struct MyEventListView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventListView()
    }
}
