//
//  RecipeRatingView.swift
//  Avocados
//
//  Created by Andres Donoso on 27/12/23.
//

import SwiftUI

struct RecipeRatingView: View {
    //MARK: - PROPERTIES
    var recipe: Recipe
    
    //MARK: - BODY
    var body: some View {
        HStack(spacing: 5) {
            ForEach(1...recipe.rating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 320, height: 60)) {
    RecipeRatingView(recipe: recipesData[0])
}
