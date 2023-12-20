//
//  SectionView.swift
//  Touchdown
//
//  Created by Andres Donoso on 19/12/23.
//

import SwiftUI

struct SectionView: View {
    //MARK: - PROPERTIES
    @State var rotateClockwise: Bool
    
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Text("Categories".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .rotationEffect(.degrees(rotateClockwise ? 90 : -90))
            
            Spacer()
        } //: VStack
        .background(colorGray.clipShape(.rect(cornerRadius: 12)))
        .frame(width: 85)
    }
}

#Preview(traits: .fixedLayout(width: 120, height: 240)) {
    SectionView(rotateClockwise: false)
        .padding()
        .background(colorBackground)
}
