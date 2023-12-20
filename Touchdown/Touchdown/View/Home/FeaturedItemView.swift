//
//  FeaturedItemView.swift
//  Touchdown
//
//  Created by Andres Donoso on 19/12/23.
//

import SwiftUI

struct FeaturedItemView: View {
    //MARK: - PROPERTIES
    let player: Player
    
    //MARK: - BODY
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FeaturedItemView(player: players[0])
        .padding()
        .background(colorBackground)
}
