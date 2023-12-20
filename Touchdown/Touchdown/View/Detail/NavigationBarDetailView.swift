//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Andres Donoso on 20/12/23.
//

import SwiftUI

struct NavigationBarDetailView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Button {
                feedback.impactOccurred()
                withAnimation(.easeIn) {
                    shop.selectedProduct = nil
                    shop.showingProduct = false
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundStyle(.white)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NavigationBarDetailView()
        .padding()
        .background(.gray)
        .environmentObject(Shop())
}
