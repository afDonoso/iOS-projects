//
//  InsetMapView.swift
//  Africa
//
//  Created by Andres Donoso on 11/12/23.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    //MARK: - PROPERTIES
    @State private var region = MKCoordinateRegion(center: .init(latitude: 6.600286, longitude: 16.4377599), span: .init(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    //MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(alignment: .topTrailing) {
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundStyle(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundStyle(.accent)
                            .fontWeight(.bold)
                    } //: HStack
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .clipShape(.rect(cornerRadius: 8))
                    )
                } //: Navigation
                .padding(12)
            }
            .frame(height: 256)
            .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InsetMapView()
        .padding()
}
