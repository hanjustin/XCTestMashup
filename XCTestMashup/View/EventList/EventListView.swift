//
//  EventListView.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/26/23.
//

import SwiftUI

struct EventListView: View {
    @StateObject var viewmodel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewmodel.events) { event in
                NavigationLink(value: event) {
                    EventRow(title: event.name ?? "",
                             subTitle: "\(String(describing: event.id))")
                }
            }
        }
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EventListView(viewmodel: .init())
        }
    }
}
