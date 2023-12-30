//
//  EmtpyListView.swift
//  TodoApp
//
//  Created by Andres Donoso on 30/12/23.
//

import SwiftUI

struct EmtpyListView: View {
    //MARK: - PROPERTIES
    let images = ["illustration-no1", "illustration-no2", "illustration-no3"]
    
    let tips = [
        "Use your time wisely.",
        "Slow and steady wins the race.",
        "Keep it short and sweet.",
        "Put hard tasks first."
    ]
    
    @State private var isAnimating = false
    
    @ObservedObject var theme = ThemeSettings()
    var themes: [Theme] = themeData
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image(images.randomElement()!)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360)
                    .layoutPriority(1)
                    .foregroundStyle(themes[theme.themeSettings].themeColor)
                
                Text(tips.randomElement()!)
                    .layoutPriority(0.5)
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(themes[theme.themeSettings].themeColor)
            } //: VStack
            .padding(.horizontal)
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -50)
            .animation(.easeOut(duration: 1.5), value: isAnimating)
            .onAppear {
                isAnimating.toggle()
            }
        } //: ZStack
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(.colorBase)
    }
}

#Preview {
    EmtpyListView()
}
