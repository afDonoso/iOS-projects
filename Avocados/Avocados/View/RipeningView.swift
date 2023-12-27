//
//  RipeningView.swift
//  Avocados
//
//  Created by Andres Donoso on 27/12/23.
//

import SwiftUI

struct RipeningView: View {
    //MARK: - PROPERTIES
    var ripening: Ripening
    
    @State private var slideInAnimation = false
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Image(ripening.image)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(.circle)
                .background(
                    Circle()
                        .fill(.colorGreenLight)
                        .frame(width: 110, height: 110)
                )
                .background(
                    Circle()
                        .fill(.colorAppearanceAdpative)
                        .frame(width: 120, height: 120)
                )
                .zIndex(1)
                .offset(y: slideInAnimation ? 55 : -55)
            
            VStack(spacing: 10) {
                // STAGE
                VStack(spacing: 0) {
                    Text(ripening.stage)
                        .font(.system(.largeTitle, design: .serif))
                        .bold()
                    
                    Text("Stage")
                        .font(.system(.body, design: .serif))
                        .fontWeight(.heavy)
                }
                .foregroundStyle(.colorGreenMedium)
                .padding(.top, 65)
                .frame(width: 180)
                
                // TITLE
                Text(ripening.title)
                    .font(.system(.title, design: .serif))
                    .bold()
                    .foregroundStyle(.colorGreenMedium)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 0)
                    .frame(width: 220)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                LinearGradient(colors: [.white, .colorGreenLight], startPoint: .top, endPoint: .bottom)
                            )
                            .shadow(color: .colorBlackTransparentLight, radius: 6, y: 6)
                    )
                
                // DESCRIPTION
                Spacer()
                Text(ripening.description)
                    .foregroundStyle(.colorGreenDark)
                    .fontWeight(.bold)
                Spacer()
                
                // RIPENESS
                Text(ripening.ripeness.uppercased())
                    .foregroundStyle(.white)
                    .font(.system(.callout, design: .serif))
                    .fontWeight(.bold)
                    .shadow(radius: 3)
                    .padding(.vertical)
                    .padding(.horizontal, 0)
                    .frame(width: 185)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                LinearGradient(colors: [.colorGreenMedium, .colorGreenDark], startPoint: .top, endPoint: .bottom)
                            )
                            .shadow(color: .colorBlackTransparentLight, radius: 6, y: 6)
                    )
                
                // INSTRUCTION
                Text(ripening.instruction)
                    .font(.footnote)
                    .foregroundStyle(.colorGreenLight)
                    .fontWeight(.bold)
                    .lineLimit(3)
                    .frame(width: 160)
                
                Spacer()
            } //: VStack
            .zIndex(0)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .frame(width: 260, height: 485)
            .background(
                LinearGradient(colors: [.colorGreenLight, .colorGreenMedium], startPoint: .top, endPoint: .bottom)
            )
            .clipShape(.rect(cornerRadius: 20))
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1)) {
                slideInAnimation.toggle()
            }
        }
    }
}

#Preview {
    RipeningView(ripening: ripeningsData[1])
}
