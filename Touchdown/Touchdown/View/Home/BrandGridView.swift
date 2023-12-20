//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Andres Donoso on 20/12/23.
//

import SwiftUI

struct BrandGridView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
                ForEach(brands) { brand in
                    BrandItemView(brand: brand)
                } //: Loop
            }) //: Grid
            .frame(height: 200)
            .padding(15)
        } //: Scroll
        .scrollIndicators(.hidden)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    BrandGridView()
        .background(colorBackground)
}
