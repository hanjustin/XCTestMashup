//
//  SearchViewViewModel.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/27/23.
//

import Foundation

class EventSearchViewModel: ObservableObject {
    enum SearchState {
        case locationAccessNotDetermined
        case locationAccessDenied
        case fetching
        case finished
    }
    
    private(set) var searchingState = SearchState.locationAccessNotDetermined
}
