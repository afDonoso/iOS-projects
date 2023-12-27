//
//  CardView.swift
//  Learn by Doing
//
//  Created by Andres Donoso on 26/12/23.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    var gradient: [Color] = [.color01, .color02]
    
    var card: Card
    
    @State private var fadeIn = false
    @State private var moveDownward = false
    @State private var moveUpward = false
    @State private var showAlert = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1 : 0)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .italic()
            } //: VStack
            .offset(y: moveDownward ? -218 : -300)
            
            Button {
                playSound(sound: "sound-chime", type: "mp3")
                hapticImpact.impactOccurred()
                showAlert.toggle()
            } label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .tint(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(.title)
                        .fontWeight(.medium)
                        .tint(.white)
                } //: HStack
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(colors: card.gradientColors, startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(.capsule)
                .shadow(color: .colorShadow, radius: 6, x: 0, y: 3)
            } // Button
            .offset(y: moveUpward ? 210 : 300)
            
        } //: ZStack
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom)
        )
        .clipShape(.rect(cornerRadius: 16))
        .shadow(radius: 8)
        .onAppear {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn = true
            }
            
            withAnimation(.linear(duration: 0.8)) {
                moveDownward.toggle()
                moveUpward.toggle()
            }
        } //: OnAppear
        .alert(card.title, isPresented: $showAlert) {
            Button("Ok") {
                
            }
        } message: {
            Text(card.message)
        }

    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CardView(card: cardData[1])
}
