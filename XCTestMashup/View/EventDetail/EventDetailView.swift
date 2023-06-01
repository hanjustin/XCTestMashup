//
//  DetailView.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/30/23.
//

import SwiftUI

struct EventDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel: ViewModel
    @State private var showingCreateEventDetail = false
    var isReadOnly: Bool { viewModel.state == .readMode }
    
    var body: some View {
        Form {
            EventDetailTextFieldSectionsView(
                name: $viewModel.event.name,
                description: $viewModel.event.description
            )

            if viewModel.state == .updateMode {
                deleteButton
            }
        }
        .disabled(isReadOnly)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            rightToolbarButton
        }
        .sheet(isPresented: $showingCreateEventDetail) {
            NavigationStack {
                EventDetailView(viewModel: .init(state: .createMode))
            }
        }
    }
}

private extension EventDetailView {
    var deleteButton: some View {
        Button("Delete Event", role: .destructive) {

        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - ToolbarContent

private extension EventDetailView {
    @ToolbarContentBuilder
    var rightToolbarButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            switch viewModel.state {
            case .createMode:
                Button("Create", action: { viewModel.create() })
            case .updateMode:
                Button("Update", action: { viewModel.update() })
            case .readMode:
                Button("Copy", action: { viewModel.create() })
            }
        }
    }
}

// MARK: - Texts

private extension EventDetailView {
    var title: String {
        switch viewModel.state {
        case .createMode: return "New Event"
        case .readMode, .updateMode: return viewModel.event.name
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(viewModel: .init(state: .createMode))
    }
}
