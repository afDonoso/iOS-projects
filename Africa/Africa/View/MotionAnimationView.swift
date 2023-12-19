//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Andres Donoso on 18/12/23.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - PROPERTIES
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    //MARK: - FUNCTIONS
    
    // 1. RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
        return .random(in: 0.025...1.0)
    }
    
    // 5. RANDOM DELAY
    func randomDelay() -> Double {
        return .random(in: 0...2)
    }
    
    //MARK: - BODY
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundStyle(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize())
                        .scaleEffect(randomScale())
                        .position(
                            x: randomCoordinate(max: geo.size.width),
                            y: randomCoordinate(max: geo.size.height)
                        )
                        .animation(
                            .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay()),
                            value: isAnimating
                        )
                        .onAppear {
                            isAnimating = true
                        }
                } //: Loop
            } //: ZStack
            .drawingGroup()
        } //: Geometry
    }
}

#Preview {
    MotionAnimationView()
}
