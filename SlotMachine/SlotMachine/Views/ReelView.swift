//
//  ReelView.swift
//  SlotMachine
//
//  Created by Andres Donoso on 28/12/23.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image(.gfxReel)
            .resizable()
            .modifier(ImageModifier())
    }
}

#Preview(traits: .fixedLayout(width: 220, height: 220)) {
    ReelView()
        .padding()
}
