//
//  CustomShape.swift
//  Touchdown
//
//  Created by Andres Donoso on 20/12/23.
//

import SwiftUI

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}

#Preview(traits: .fixedLayout(width: 428, height: 120)) {
    CustomShape()
        .padding()
}
