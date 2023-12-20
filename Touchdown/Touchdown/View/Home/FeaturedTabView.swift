//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by Andres Donoso on 19/12/23.
//

import SwiftUI

struct FeaturedTabView: View {
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedItemView(player: player)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            }
        } //: Tab
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    FeaturedTabView()
        .background(.gray)
}
