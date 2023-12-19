//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Andres Donoso on 18/12/23.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    return AnimalGridItemView(animal: animals[0])
        .padding()
}
