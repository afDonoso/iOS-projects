//
//  CoverImageView.swift
//  Africa
//
//  Created by Andres Donoso on 10/12/23.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - PROPERTIES
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } //: Loop
        } //: TabView
        .tabViewStyle(.page)
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 300)) {
    CoverImageView()
}
