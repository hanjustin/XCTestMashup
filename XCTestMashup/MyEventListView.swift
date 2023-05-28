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
            EventListView()
            .navigationTitle("My Events")
            .toolbar {
//                test
            }
        }
    }

}

struct MyEventListView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventListView()
    }
}
