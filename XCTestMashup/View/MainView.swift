//
//  MainView.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/26/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MyEventListView()
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
            
            EventSearchView(viewModel: .init())
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
