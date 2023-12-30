//
//  FormRowStaticView.swift
//  TodoApp
//
//  Created by Andres Donoso on 30/12/23.
//

import SwiftUI

struct FormRowStaticView: View {
    //MARK: - PROPERTIES
    var icon: String
    var firstText: String
    var secondText: String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray)
                Image(systemName: icon)
                    .foregroundStyle(.white)
            }
            .frame(width: 36, height: 36)
            
            Text(firstText)
                .foregroundStyle(.gray)
            
            Spacer()
            
            Text(secondText)
        } //: HStack
    }
}

#Preview(traits: .fixedLayout(width: 375, height: 60)) {
    FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
        .padding()
}
