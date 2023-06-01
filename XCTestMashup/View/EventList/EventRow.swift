//
//  EventRow.swift
//  XCTestMashup
//
//  Created by Justin Lee on 5/27/23.
//

import SwiftUI

struct EventRow: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.bold)
                .font(.headline)
            Text(subTitle)
                .font(.subheadline)
                .lineLimit(2)
        }
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(title: "Title", subTitle: "SubTitle")
    }
}
