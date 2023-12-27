//
//  FactsView.swift
//  Avocados
//
//  Created by Andres Donoso on 27/12/23.
//

import SwiftUI

struct FactsView: View {
    //MARK: - PROPERTIES
    var fact: Fact
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Text(fact.content)
                .padding(.leading, 55)
                .padding(.trailing, 10)
                .padding(.vertical, 3)
                .frame(width: 300, height: 135)
                .background(
                    LinearGradient(colors: [.colorGreenMedium, .colorGreenLight], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(.rect(cornerRadius: 12))
                .lineLimit(6)
                .font(.footnote)
            .foregroundStyle(.white)
            
            Image(fact.image)
                .resizable()
                .frame(width: 66, height: 66)
                .clipShape(.circle)
                .background(
                    Circle()
                        .fill(.white)
                        .frame(width: 74, height: 74)
                )
                .background(
                    Circle()
                        .fill(
                            LinearGradient(colors: [.colorGreenMedium, .colorGreenLight], startPoint: .trailing, endPoint: .leading)
                        )
                        .frame(width: 82, height: 82)
                )
                .background(
                    Circle()
                        .fill(.colorAppearanceAdpative)
                        .frame(width: 90, height: 90)
                )
                .offset(x: -150)
        }
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 220)) {
    FactsView(fact: factsData[0])
}
