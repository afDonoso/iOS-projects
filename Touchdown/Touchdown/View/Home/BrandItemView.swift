//
//  BrandItemView.swift
//  Touchdown
//
//  Created by Andres Donoso on 20/12/23.
//

import SwiftUI

struct BrandItemView: View {
    //MARK: - PROPERTIES
    let brand: Brand
    
    //MARK: - BODY
    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit()
            .padding()
            .background(Color.white.clipShape(.rect(cornerRadius: 12)))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray, lineWidth: 1)
            )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    BrandItemView(brand: brands[0])
        .padding()
        .background(colorBackground)
}
