//
//  CategoryGridView.swift
//  Touchdown
//
//  Created by Andres Donoso on 19/12/23.
//

import SwiftUI

struct CategoryGridView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: []) {
                Section(
                    header: SectionView(rotateClockwise: false),
                    footer: SectionView(rotateClockwise: true)
                ) {
                    ForEach(categories) { category in
                        CategoryItemView(category: category)
                    }
                }
            } //: Grid
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        } //: Scroll
        .scrollIndicators(.hidden)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CategoryGridView()
        .padding()
        .background(colorBackground)
}
