//
//  SearchView.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/26/23.
//

import CoreLocationUI
import SwiftUI

struct EventSearchView: View {
    @State private var searchRadius = 100
    @StateObject var viewModel: ViewModel
    
    var body: some View {
            switch viewModel.viewState {
            case .locationAccessNotDetermined:
                VStack {
                    informationText(Constants.LocationRequest)
                    locationButton
                }
                
            case .locationAccessDenied:
                informationText(Constants.LocationDenied)
                
            case .fetching:
                progressView
                
            case .finished:
                NavigationStack {
                    EventListView(viewmodel: .init())
                        .navigationTitle(String(format: Constants.navTitleNearEvents, searchRadius))
                        .toolbar {
                            randomizeSearchRadiusButton
                        }
                        .navigationDestination(for: Event.self) { event in
                            EventDetailView(viewModel: .init(state: .readMode, event))
                        }
                }
        }
    }
    
    private var locationButton: some View {
        LocationButton(.currentLocation) {
            
            
        }
        .symbolVariant(.fill)
        .foregroundColor(.white)
        .cornerRadius(118)
    }
    
    private var progressView: some View {
        ProgressView().controlSize(.large)
    }
    
    private func informationText(_ text: String) -> some View {
        Text(text).multilineTextAlignment(.center)
    }
    
    private enum Constants {
        static var navTitleNearEvents: String { "Events in %dkm radius" }
        static let LocationRequest = "Please allow location access\nto simulate searching your area"
        static let LocationDenied = "Location access denied.\nPlease authorize it in settings"
    }
}

// MARK: - ToolbarContent

private extension EventSearchView {
    var randomizeSearchRadiusButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                searchRadius = Int.random(in: 1...100)
            } label: {
                HStack {
                    Text("Randomize search radius")
                    Image(systemName: "dice")
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        EventSearchView(viewModel: .init())
    }
}
