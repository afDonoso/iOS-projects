//
//  HomeView.swift
//  Restart
//
//  Created by Andrés Donoso on 1/12/23.
//

import SwiftUI

struct HomeView: View {
    //MARK: - Properties
    @AppStorage("onboarding") var isOnboardingViewActive = false
    
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 20) {
            //MARK: - Header
            Spacer()
            
            ZStack {
                CircleGroupView(
                    shapeColor: .gray,
                    shapeOpacity: 0.1
                )
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
            }
            
            //MARK: - Center
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            //MARK: - Footer
            Spacer()
            
            Button {
                isOnboardingViewActive = true
                DispatchQueue.main.async {
                    playSound("success", type: "m4a")
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } //: Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VStack
        .onAppear {
            DispatchQueue.main.asyncAfter(
                deadline: .now() + 0.5,
                execute: { isAnimating = true }
            )
        }
    }
}

#Preview {
    HomeView()
}
