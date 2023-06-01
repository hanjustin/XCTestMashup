//
//  SearchViewViewModel.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/30/23.
//

import Foundation

extension EventSearchView {
    @MainActor class ViewModel: ObservableObject {
        enum SearchViewState {
            case locationAccessNotDetermined
            case locationAccessDenied
            case fetching
            case finished
        }
        
        private(set) var viewState = SearchViewState.finished
    }
}
