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
    var isReadOnly: Bool {
        if case .readMode = viewModel.state { return true } else { return false }
    }
    
    var body: some View {
        Form {
            if let nameBinding = Binding<String>($viewModel.eventEntity.name),
               let detailBinding = Binding<String>($viewModel.eventEntity.detail) {
                EventDetailTextFieldSectionsView(
                    name: nameBinding,
                    description: detailBinding
                )
            }

            if case .editMode = viewModel.state {
                deleteButton
            }
        }
        .disabled(isReadOnly)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            rightToolbarButton
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
            case .editMode:
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
        case .readMode, .editMode: return viewModel.eventEntity.name ?? ""
        }
    }
}

