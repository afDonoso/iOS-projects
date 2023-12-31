//
//  HeaderComponent.swift
//  Honeymoon
//
//  Created by Andres Donoso on 30/12/23.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(spacing: 20) {
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundStyle(.secondary)
                .opacity(0.2)
            
            Image(.logoHoneymoon)
                .resizable()
                .scaledToFit()
                .frame(height: 28)
        }
    }
}

#Preview(traits: .fixedLayout(width: 375, height: 128)) {
    HeaderComponent()
}
