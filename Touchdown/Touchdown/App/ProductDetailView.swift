//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Andres Donoso on 20/12/23.
//

import SwiftUI

struct ProductDetailView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    
    //MARK: - BODY
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 5) {
                // NAVBAR
                NavigationBarDetailView()
                    .padding(.horizontal)
                    .padding(.top, geo.safeAreaInsets.top)
                
                // HEADER
                HeaderDetailView()
                    .padding(.horizontal)
                
                // DETAIL TOP PART
                TopPartDetailView()
                    .padding(.horizontal)
                    .zIndex(1)
                
                // DETAIL BOTTOM PART
                VStack(alignment: .center, spacing: 0) {
                    // RATINGS + SIZES
                    RatingsSizesDetailView()
                        .padding(.top, -25)
                        .padding(.bottom, 10)
                    
                    // DESCRIPTION
                    ScrollView(.vertical) {
                        Text(shop.selectedProduct?.description ?? sampleProduct.description)
                            .font(.system(.body, design: .rounded))
                            .foregroundStyle(.gray)
                    } //: Scroll
                    .scrollIndicators(.hidden)
                    
                    // QUANTITY + FAVORITE
                    QuantityFavoriteDetailView()
                        .padding(.vertical, 10)
                    
                    // ADD TO CART
                    AddToCartDetailView()
                        .padding(.bottom, 20)
                } //: VStack
                .padding(.horizontal)
                .background(
                    Color.white
                        .clipShape(CustomShape())
                        .padding(.top, -105)
                )
            } //: VStack
            .zIndex(0)
            .ignoresSafeArea(.all, edges: .all)
            .background(
                Color(
                    red: shop.selectedProduct?.red ?? sampleProduct.red,
                    green: shop.selectedProduct?.green ?? sampleProduct.green,
                    blue: shop.selectedProduct?.blue ?? sampleProduct.blue
                )
            )
            .ignoresSafeArea(.all, edges: .all)
        } //: VStack
    } //: Geo
}

#Preview(traits: .fixedLayout(width: 375, height: 812)) {
    ProductDetailView()
        .environmentObject(Shop())
}
