//
//  CreditsView.swift
//  Africa
//
//  Created by Andres Donoso on 18/12/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
            Copyright © Andres Donoso
            All rights reserved
            Better Apps ♡ Less Code
            """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        } //: VStack
        .padding()
        .opacity(0.4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CreditsView()
        .padding()
}
