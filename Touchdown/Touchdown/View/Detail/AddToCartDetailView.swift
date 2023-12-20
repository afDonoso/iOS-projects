//
//  AddToCartDetailView.swift
//  Touchdown
//
//  Created by Andres Donoso on 20/12/23.
//

import SwiftUI

struct AddToCartDetailView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    
    //MARK: - BODY
    var body: some View {
        Button {
            feedback.impactOccurred()
        } label: {
            Spacer()
            
            Text("Add to cart".uppercased())
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Spacer()
        } //: Button
        .padding(15)
        .background(
            Color(
                red: shop.selectedProduct?.red ?? sampleProduct.red,
                green: shop.selectedProduct?.green ?? sampleProduct.green,
                blue: shop.selectedProduct?.blue ?? sampleProduct.blue
            )
        )
        .clipShape(.capsule)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AddToCartDetailView()
        .padding()
        .environmentObject(Shop())
}
