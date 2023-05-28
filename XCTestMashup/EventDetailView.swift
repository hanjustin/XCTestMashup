//
//  DetailView.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/27/23.
//

import SwiftUI

struct EventDetailView: View {
    @Environment(\.dismiss) var dismiss
    var showLeftButton = false
    var event: Event = Event(id: UUID(), name: "Default")
    @State var input = ""
    
    var body: some View {
        
        Form {
            Section("Event Name") {
                TextField("Name", text: $input)
            }
        }
        .navigationTitle(event.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if showLeftButton {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Conditional") {
                        print("Pressed")
                    }
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Right") {
                    print("Pressed")
                }
            }
        }
    }
}

struct ModalDetailView: View {
    var body: some View {
        NavigationStack {
            EventDetailView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Conditional") {
                            print("Pressed")
                        }
                    }
                }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}
