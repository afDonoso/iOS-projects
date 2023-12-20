//
//  TitleView.swift
//  Touchdown
//
//  Created by Andres Donoso on 20/12/23.
//

import SwiftUI

struct TitleView: View {
    //MARK: - PREVIEW
    var title: String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
            .fontWeight(.heavy)
            
            Spacer()
        } //: HStack
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TitleView(title: "Helmet")
        .background(colorBackground)
}
