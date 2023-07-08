//
//  ContentView.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            EventSearchView(viewModel: .init())
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
