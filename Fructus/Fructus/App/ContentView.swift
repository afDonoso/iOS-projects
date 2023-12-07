//
//  ContentView.swift
//  Fructus
//
//  Created by Andres Donoso on 5/12/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    var fruits = fruitsData
    
    @State private var isShowingSettings = false
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    } //: LINK
                } //: LOOP
            } //: LIST
            .navigationTitle("Fruits")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingSettings = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    } //: BUTTON
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
                    
                } //: TOOLBAR ITEM
            } //: TOOLBAR
        } //: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
