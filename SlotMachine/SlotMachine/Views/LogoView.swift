//
//  LogoView.swift
//  SlotMachine
//
//  Created by Andres Donoso on 28/12/23.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image(.gfxSlotMachine)
            .resizable()
            .scaledToFit()
            .frame(minWidth: 256, idealWidth: 300, maxWidth: 320, minHeight: 112, idealHeight: 130, maxHeight: 140)
            .padding(.top)
            .padding(.horizontal)
            .layoutPriority(1)
            .modifier(ShadowModifier())
    }
}

#Preview {
    LogoView()
}
