//
//  SymbolModifier.swift
//  Honeymoon
//
//  Created by Andres Donoso on 30/12/23.
//

import SwiftUI

struct SymbolModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.system(size: 128))
            .shadow(color: .black.opacity(0.2), radius: 12)
    }
}
