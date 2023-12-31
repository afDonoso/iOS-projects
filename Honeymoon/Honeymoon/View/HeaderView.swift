//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Andres Donoso on 30/12/23.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - PROPERTIES
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    let haptics = UINotificationFeedbackGenerator()
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                playSound(sound: "sound-click", type: "mp3")
                haptics.notificationOccurred(.success)
                showInfoView.toggle()
            }, label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
                    .tint(.primary)
            })
            .sheet(isPresented: $showInfoView, content: {
                InfoView()
            })
            
            Spacer()
            
            Image(.logoHoneymoonPink)
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button(action: {
                playSound(sound: "sound-click", type: "mp3")
                haptics.notificationOccurred(.success)
                showGuideView.toggle()
            }, label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
                    .tint(.primary)
            })
            .sheet(isPresented: $showGuideView, content: {
                GuideView()
            })
        } //: HStack
        .padding()
    }
}

#Preview(traits: .fixedLayout(width: 375, height: 80)) {
    HeaderView(showGuideView: .constant(false), showInfoView: .constant(false))
}
