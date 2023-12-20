//
//  CategoryItemView.swift
//  Touchdown
//
//  Created by Andres Donoso on 19/12/23.
//

import SwiftUI

struct CategoryItemView: View {
    //MARK: - PROPERTIES
    let category: Category
    
    //MARK: - BODY
    var body: some View {
        Button {
            
        } label: {
            HStack(alignment: .center, spacing: 6) {
                Image(category.image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.gray)
                
                Text(category.name.uppercased())
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                
                Spacer()
            } //: HStack
            .padding()
            .background(
                Color.white
                    .clipShape(.rect(cornerRadius: 12))
            )
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray, lineWidth: 1)
            )
        } //: Button
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CategoryItemView(category: categories[0])
        .padding()
        .background(colorBackground)
}
