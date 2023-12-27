//
//  RecipeCardView.swift
//  Avocados
//
//  Created by Andres Donoso on 27/12/23.
//

import SwiftUI

struct RecipeCardView: View {
    //MARK: - PROPERTIES
    var recipe: Recipe
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var showModal = false
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay {
                    HStack {
                        Spacer()
                        
                        VStack {
                            Image(systemName: "bookmark")
                                .font(.title.weight(.light))
                                .foregroundStyle(.white)
                                .imageScale(.small)
                            .shadow(color: .colorBlackTransparentLight, radius: 2)
                            .padding(.trailing, 20)
                            .padding(.top, 20)
                            
                            Spacer()
                        }
                    } //: HStack
                } //: Overlay
            
            VStack(alignment: .leading, spacing: 12) {
                // TITLE
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundStyle(.colorGreenMedium)
                    .lineLimit(1)
                
                // HEADLINE
                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundStyle(.gray)
                    .italic()
                
                // RATES
                RecipeRatingView(recipe: recipe)
                
                // COOKING
                RecipeCookingView(recipe: recipe)
            }
            .padding()
            .padding(.bottom, 12)
        }
        .background(.white)
        .clipShape(.rect(cornerRadius: 12))
        .shadow(color: .colorBlackTransparentLight, radius: 8)
        .onTapGesture {
            hapticImpact.impactOccurred()
            showModal = true
        }
        .sheet(isPresented: $showModal, content: {
            RecipeDetailView(recipe: recipe)
        })
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RecipeCardView(recipe: recipesData[0])
}
