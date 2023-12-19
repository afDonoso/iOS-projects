//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Andres Donoso on 11/12/23.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .clipShape(.rect(cornerRadius: 12))
                } //: Loop
            } //: HStack
        } //: ScrollView
        .scrollIndicators(.hidden)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    return InsetGalleryView(animal: animals[0])
        .padding()
}
