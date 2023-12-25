//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Andres Donoso on 22/12/23.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundImageView()
}
