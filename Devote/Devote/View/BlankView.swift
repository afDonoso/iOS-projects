//
//  BlankView.swift
//  Devote
//
//  Created by Andres Donoso on 22/12/23.
//

import SwiftUI

struct BlankView: View {
    //MARK: - PROPERTIES
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(backgroundColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
    }
}

#Preview {
    BlankView(backgroundColor: .black, backgroundOpacity: 0.3)
        .background(BackgroundImageView())
        .background(backgroundGradient)
}
