//
//  CustomCircleView.swift
//  Hike
//
//  Created by Andrés Donoso on 1/12/23.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimatedGradient = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .customIndigoMedium,
                            .customSalmonLight
                        ],
                        startPoint: isAnimatedGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimatedGradient ? .bottomTrailing : .topTrailing
                    )
                )
                .onAppear {
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                        isAnimatedGradient.toggle()
                    }
                }
            
            MotionAnimationView()
        } //: ZStack
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
