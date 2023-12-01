//
//  CustomListRowView.swift
//  Hike
//
//  Created by Andrés Donoso on 1/12/23.
//

import SwiftUI

struct CustomListRowView: View {
    //MARK: - Properties
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if let rowContent {
                Text(rowContent)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)
            } else if let rowLinkLabel, let rowLinkDestination {
                Link(
                    rowLinkLabel,
                    destination: URL(string: rowLinkDestination)!
                )
                .foregroundColor(.pink)
                .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    
                    Image(systemName: rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                
                Text(rowLabel)
            }
        } //: LabeledContent
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    List {
        CustomListRowView(
            rowLabel: "Designer",
            rowIcon: "paintpalette",
            rowContent: "John Doe",
            rowTintColor: .pink
        )
        
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowTintColor: .indigo,
            rowLinkLabel: "Credo Academy",
            rowLinkDestination: "https://credo.academy"
        )
    }
}
