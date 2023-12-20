//
//  ProductItemView.swift
//  Touchdown
//
//  Created by Andres Donoso on 20/12/23.
//

import SwiftUI

struct ProductItemView: View {
    //MARK: - PROPERTIES
    let product: Product
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // PHOTO
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            } //: ZStack
            .background(
                Color(red: product.red, green: product.green, blue: product.blue)
            )
            .clipShape(.rect(cornerRadius: 12))
            
            // NAME
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
            
            // PRICE
            Text(product.formattedPrice)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
            
        } //: VStack
    }
}

#Preview(traits: .fixedLayout(width: 200, height: 300)) {
    ProductItemView(product: products[0])
        .padding()
        .background(colorBackground)
}
