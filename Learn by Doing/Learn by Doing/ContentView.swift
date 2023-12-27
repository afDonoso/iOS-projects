//
//  ContentView.swift
//  Learn by Doing
//
//  Created by Andres Donoso on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    var cards: [Card] = cardData
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(cards) { card in
                    CardView(card: card)
                }
            } //: HStack
            .padding(20)
        } //: ScrollView
    }
}

#Preview {
    ContentView()
}
