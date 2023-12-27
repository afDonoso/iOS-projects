//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Andres Donoso on 26/12/23.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - PROPERTIES
    var title: String = ""
    
    //MARK: - BODY
    var body: some View {
        VStack {
            // TITLE
            if !title.isEmpty {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
            }
            
            // SEPARATOR
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } //: HStack
            .foregroundStyle(.accent)
        } //: VStack
    }
}

#Preview {
    HeaderView(title: "Credits")
}

#Preview {
    HeaderView()
}
