//
//  NavigationBarView.swift
//  Touchdown
//
//  Created by Andres Donoso on 19/12/23.
//

import SwiftUI

struct NavigationBarView: View {
    //MARK: - PROPERTIES
    @State private var isAnimated = false
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundStyle(.black)
            } //: Button
            
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(y: isAnimated ? 0: -25)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                }
            
            Spacer()
            
            Button {
                //: TODO
            } label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                    .foregroundStyle(.black)
                    
                    Circle()
                        .fill(.red)
                        .frame(width: 14, height: 14)
                        .offset(x: 13, y: -10)
                } //: ZStack
            } //: Button
        } //: HStack
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NavigationBarView()
        .padding()
}
