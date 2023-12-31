//
//  CardTransition.swift
//  Honeymoon
//
//  Created by Andres Donoso on 30/12/23.
//

import SwiftUI

extension AnyTransition {
    static var trailingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: .move(edge: .trailing).combined(with: .move(edge: .bottom))
        )
    }
    
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: .move(edge: .leading).combined(with: .move(edge: .bottom))
        )
    }
}
