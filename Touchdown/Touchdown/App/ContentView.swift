//
//  ContentView.swift
//  Touchdown
//
//  Created by Andres Donoso on 19/12/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            if !shop.showingProduct && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding()
                        .background(.white)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    ScrollView(.vertical) {
                        VStack(spacing: 0) {
                            FeaturedTabView()
                                .padding(.vertical, 20)
                                .frame(height: UIScreen.main.bounds.width / 1.475)
                            
                            CategoryGridView()
                            
                            TitleView(title: "Helmets")
                            
                            LazyVGrid(columns: gridLayout, spacing: 15) {
                                ForEach(products) { product in
                                        ProductItemView(product: product)
                                        .onTapGesture {
                                            feedback.impactOccurred()
                                            withAnimation(.easeOut) {
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }
                                        }
                                } //: Loop
                            } //: Grid
                            .padding(15)
                            
                            TitleView(title: "Brands")
                            
                            BrandGridView()
                            
                            FooterView()
                                .padding(.horizontal)
                        }
                    } //: Scroll
                    .scrollIndicators(.hidden)
                } //: VStack
                .background(colorBackground.ignoresSafeArea())
            } else {
                ProductDetailView()
            }
        } //: ZStack
    }
}

#Preview {
    ContentView()
        .environmentObject(Shop())
}
