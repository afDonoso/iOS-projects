//
//  CenterModifier.swift
//  Africa
//
//  Created by Andres Donoso on 18/12/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
