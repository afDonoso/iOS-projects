//
//  InsetFactView.swift
//  Africa
//
//  Created by Andres Donoso on 11/12/23.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { fact in
                    Text(fact)
                }
            } //: Tabs
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: Box
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    return InsetFactView(animal: animals[0])
        .padding()
}
