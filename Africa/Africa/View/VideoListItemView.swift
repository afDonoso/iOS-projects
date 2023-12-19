//
//  VideoListItem.swift
//  Africa
//
//  Created by Andres Donoso on 11/12/23.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: - PROPERTIES
    let video: Video
    
    //MARK: - BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .clipShape(.rect(cornerRadius: 9))
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //: ZStack
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(video.headline)
                    .font(.footnote)
                    .lineLimit(2)
            } //: VStack
        } //: HStack
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let videos: [Video] = Bundle.main.decode("videos.json")
    
    return VideoListItemView(video: videos[0])
        .padding()
}
