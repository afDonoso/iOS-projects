//
//  HeaderView.swift
//  Avocados
//
//  Created by Andres Donoso on 27/12/23.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - PROPERTIES
    var header: Header
    
    @State private var showHeadline = false
    
    var slideInAnimation: Animation {
        .spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
        .speed(1)
        .delay(0.25)
    }
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Image(header.image)
                .resizable()
                .scaledToFill()
            
            HStack(spacing: 0) {
                Rectangle()
                    .fill(.colorGreenLight)
                    .frame(width: 4)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(header.headline)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .shadow(radius: 3)
                    
                    Text(header.subheadline)
                        .font(.footnote)
                        .lineLimit(2)
                        .foregroundStyle(.white)
                        .shadow(radius: 3)
                } //: VStack
                .padding(.vertical, 0)
                .padding(.horizontal, 20)
                .frame(width: 281, height: 105)
                .background(
                    .colorBlackTransparentLight
                )
            } //: HStack
            .frame(width: 285, height: 105)
            .offset(x: -66, y: showHeadline ? 75 : 220)
            .animation(slideInAnimation)
            .onAppear {
                showHeadline.toggle()
            }
        } //: ZStack
        .frame(width: 480, height: 320)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HeaderView(header: headersData[1])
}
