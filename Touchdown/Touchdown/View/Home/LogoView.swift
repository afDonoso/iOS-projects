//
//  LogoView.swift
//  Touchdown
//
//  Created by Andres Donoso on 19/12/23.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack(spacing: 4) {
            Text("Touch".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundStyle(.black)
            
            Image("logo-dark")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
            Text("Down".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundStyle(.black)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LogoView()
        .padding()
}
