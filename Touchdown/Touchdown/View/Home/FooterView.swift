//
//  Footer.swift
//  Touchdown
//
//  Created by Andres Donoso on 19/12/23.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("We offer the most cutting edge, comfortable, lightweight and durable football helmets in the market at affordable prices.")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            
            Image("logo-lineal")
                .renderingMode(.template)
                .foregroundStyle(.gray)
                .layoutPriority(0)
            
            Text("Copyright © Andres Donoso\nAll rights reserved")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
        } //: VStack
        .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FooterView()
        .background(colorBackground)
}
