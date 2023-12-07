//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Andres Donoso on 6/12/23.
//

import SwiftUI

struct SettingsRowView: View {
    //MARK: - PROPERTIES
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            
            HStack {
                Text(name)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                if let content {
                    Text(content)
                } else if let linkLabel, let linkDestination {
                    Link(linkLabel, destination: URL(string: "https://\(linkDestination)")!)
                    
                    Image(systemName: "arrow.up.right.square")
                        .foregroundStyle(.pink)
                }
            } //: HSTACK
        } //: VSTACK
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        SettingsRowView(name: "Developer", content: "John / Jane")
            .padding()
        
        SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
            .padding()
    }
}
