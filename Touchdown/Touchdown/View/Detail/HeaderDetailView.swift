//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by Andres Donoso on 20/12/23.
//

import SwiftUI

struct HeaderDetailView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Protective Gear")
            
            Text(shop.selectedProduct?.name ?? sampleProduct.name)
                .font(.largeTitle)
                .fontWeight(.black)
        } //: VStack
        .foregroundStyle(.white)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HeaderDetailView()
        .padding()
        .background(.gray)
        .environmentObject(Shop())
}
