//
//  RatingsSizesDetailView.swift
//  Touchdown
//
//  Created by Andres Donoso on 20/12/23.
//

import SwiftUI

struct RatingsSizesDetailView: View {
    //MARK: - PROPERTIES
    let sizes: [String] = ["XS", "S", "M", "L", "XL"]
    
    //MARK: - BODY
    var body: some View {
        HStack(alignment: .top, spacing: 3) {
            // RATINGS
            VStack(alignment: .leading, spacing: 3) {
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(colorGray)
                
                HStack(alignment: .center, spacing: 3) {
                    ForEach(1...5, id: \.self) { item in
                        Button {
                            
                        } label: {
                            Image(systemName: "star.fill")
                                .frame(width: 28, height: 28)
                                .background(colorGray.clipShape(.rect(cornerRadius: 5)))
                                .foregroundStyle(.white)
                        } //: Button
                    } //: Loop
                } //: HStack
            } //: VStack
            
            Spacer()
            
            // SIZES
            VStack(alignment: .trailing, spacing: 3) {
                Text("Sizes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(colorGray)
                
                HStack(alignment: .center, spacing: 5) {
                    ForEach(sizes, id: \.self) { size in
                        Button {
                            
                        } label: {
                            Text(size)
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundStyle(colorGray)
                                .frame(width: 28, height: 28)
                                .background(Color.white.clipShape(.rect(cornerRadius: 5)))
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(colorGray, lineWidth: 2)
                                )
                        } //: Button
                    } //: Loop
                } //: HStack
            } //: VStack
        } //: HStack
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingsSizesDetailView()
        .padding()
}
