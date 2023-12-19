//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Andres Donoso on 11/12/23.
//

import SwiftUI

struct ExternalWeblinkView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                    
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundStyle(.accent)
            } //: HStack
        } //: Box
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    return ExternalWeblinkView(animal: animals[0])
        .padding()
}
