//
//  EventDetailTextFieldsView.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/30/23.
//

import SwiftUI

struct EventDetailTextFieldSectionsView: View {
    @Binding var name: String
    @Binding var description: String
    
    var body: some View {
        Group {
            Section("Event Name") {
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
            }
            Section("Event Description") {
                TextField("Address", text: $description, axis: .vertical)
                    .lineLimit(Constants.minNumOfLines...Constants.maxNumOfLines)
                    .textFieldStyle(.roundedBorder)
            }
        }
    }
    
    private enum Constants {
        static let minNumOfLines = 4
        static let maxNumOfLines = 8
    }
}

struct EventDetailTextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            EventDetailTextFieldSectionsView(name: .constant("Name"), description: .constant("Description"))
        }
    }
}
