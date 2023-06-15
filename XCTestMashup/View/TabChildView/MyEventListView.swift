//
//  MyEventListView.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/27/23.
//

import SwiftUI

struct MyEventListView: View {
    var body: some View {
        NavigationStack {
            EventListView(viewmodel: .init())
            .navigationTitle("My Events")
            .toolbar {
                addEventButton
            }
            .navigationDestination(for: EventEntity.self) { event in
                EventDetailView(viewModel: .init(state: .editMode(event)))
            }
        }
    }
    
    var addEventButton: some View {
        NavigationLink {

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
