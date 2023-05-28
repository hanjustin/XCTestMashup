//
//  SearchView.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/26/23.
//

import CoreLocationUI
import SwiftUI

struct EventSearchView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var myText: String = ""
    
    var body: some View {
        VStack {
            locationButton
        }
    }
    
    var progressView: some View {
        ProgressView()
            .controlSize(.large)
    }
    
    var locationButton: some View {
        LocationButton(.currentLocation) {
            
            
        }
        .symbolVariant(.fill)
        .foregroundColor(.white)
        .cornerRadius(118)
    }
    
    var headerView: some View {
        HStack {
            Button(action: {
                // Perform action to get user location
                print("Get location")
            }) {
                Image(systemName: "location.fill")
                    .foregroundColor(.blue)
            }
            
            TextField("Enter ZIP Code", text: $myText)
                .background(Color.white)
            
            Button("Search") {
                
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .foregroundColor(.white)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        EventSearchView()
    }
}
