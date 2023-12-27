//
//  AvocadosView.swift
//  Avocados
//
//  Created by Andres Donoso on 27/12/23.
//

import SwiftUI

struct AvocadosView: View {
    //MARK: - PROPERTIES
   @State private var pulsateAnimation = false
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            Image(.avocado)
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 240)
                .shadow(color: .colorBlackTransparentDark, radius: 12, x: 0, y: 8)
                .scaleEffect(pulsateAnimation ? 1 : 0.9)
                .opacity(pulsateAnimation ? 1 : 0.9)
            
            VStack {
                Text("Avocados")
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundStyle(.white)
                    .padding()
                    .shadow(color: .colorBlackTransparentDark, radius: 4, x: 0, y: 4)
                
                Text("""
            Creamy, green, and full of nutrients!
            Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
            """)
                .font(.system(.headline, design: .serif))
                .foregroundStyle(.colorGreenLight)
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth: 640, minHeight: 120)
            } //: VStack
            .padding()
            
            Spacer()
        } //: VStack
        .background(
            Image(.background)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).repeatForever()) {
                self.pulsateAnimation.toggle()
            }
        }
    }
}

#Preview {
    AvocadosView()
}
