//
//  RecipeCookingView.swift
//  Avocados
//
//  Created by Andres Donoso on 27/12/23.
//

import SwiftUI

struct RecipeCookingView: View {
    //MARK: - PROPERTIES
    var recipe: Recipe
    
    //MARK: - BODY
    var body: some View {
        HStack(spacing: 12) {
            HStack(spacing: 2) {
                Image(systemName: "person.2")
                
                Text("Serves: \(recipe.serves)")
            }
            
            HStack(spacing: 2) {
                Image(systemName: "clock")
                
                Text("Prep: \(recipe.preparation)")
            }
            
            HStack(spacing: 2) {
                Image(systemName: "flame")
                
                Text("Cooking: \(recipe.cooking)")
            }
        }
        .font(.footnote)
        .foregroundStyle(.gray)
    }
}

#Preview(traits: .fixedLayout(width: 320, height: 60)) {
    RecipeCookingView(recipe: recipesData[0])
}
