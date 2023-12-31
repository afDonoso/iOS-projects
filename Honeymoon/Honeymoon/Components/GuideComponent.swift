//
//  GuideComponent.swift
//  Honeymoon
//
//  Created by Andres Donoso on 30/12/23.
//

import SwiftUI

struct GuideComponent: View {
    //MARK: - PROPERTIES
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    //MARK: - BODY
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundStyle(.pink)
            
            VStack(spacing: 4) {
                HStack {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundStyle(.pink)
                } //: HStack
                
                Divider()
                    .padding(.bottom, 4)
                
                Text(description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            } //: VStack
        } //: HStack
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    GuideComponent(title: "Title", subtitle: "Swipe right", description: "This is a placeholder sentence. This is a placeholder sentence. This is a placeholder sentence.", icon: "heart.circle")
}
