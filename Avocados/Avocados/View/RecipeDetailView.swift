//
//  RecipeDetailView.swift
//  Avocados
//
//  Created by Andres Donoso on 27/12/23.
//

import SwiftUI

struct RecipeDetailView: View {
    //MARK: - PROPERTIES
    var recipe: Recipe
    
    @Environment(\.dismiss) var dismiss
    
    @State private var pulsate = false
    
    //MARK: - BODY
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // IMAGE
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                Group {
                    // TITLE
                    Text(recipe.title)
                        .font(.system(.largeTitle, design: .serif))
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.colorGreenAdaptive)
                        .padding(.top, 10)
                    
                    // RATING
                    RecipeRatingView(recipe: recipe)
                    
                    // COOKING
                    RecipeCookingView(recipe: recipe)
                    
                    // INGREDIENTS
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(ingredient)
                                    .font(.footnote)
                                
                                Divider()
                            }
                        }
                    }
                    
                    // INSTRUCTIONS
                    Text("Instructions")
                        .bold()
                        .modifier(TitleModifier())
                    
                    ForEach(recipe.instructions, id: \.self) { instruction in
                        VStack(spacing: 5) {
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42)
                                .imageScale(.large)
                                .font(.title.weight(.ultraLight))
                                .foregroundStyle(.colorGreenAdaptive)
                            
                            Text(instruction)
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                                .frame(minHeight: 100)
                        }
                    }
                    
                } //: Group
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            } //: VStack
        }
        .ignoresSafeArea()
        .overlay {
            HStack {
                Spacer()
                
                VStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                            .foregroundStyle(.white)
                            .shadow(radius: 4)
                            .opacity(pulsate ? 1 : 0.6)
                            .scaleEffect(pulsate ? 1.2 : 0.8, anchor: .center)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 24)
                    
                    Spacer()
                }
            } //: HStack
            
        } //: Overlay
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                pulsate.toggle()
            }
        }
    }
}

#Preview {
    RecipeDetailView(recipe: recipesData[0])
}
