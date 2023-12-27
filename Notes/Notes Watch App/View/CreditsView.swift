//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Andres Donoso on 26/12/23.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - PROPERTIES
    @State private var randomNumber: Int = .random(in: 1..<4)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 3) {
            // PROFILE IMAGE
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
                
            // HEADER
            HeaderView(title: "Credits")
            
            // CONTENT
            Text("Andrés Donoso")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fontWeight(.light)
        } //: VStack
    }
}

#Preview {
    CreditsView()
}
