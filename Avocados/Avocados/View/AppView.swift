//
//  AppView.swift
//  Avocados
//
//  Created by Andres Donoso on 27/12/23.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            AvocadosView()
                .tabItem {
                    Image("tabicon-branch")
                    Text("Avocados")
                }
            
            ContentView()
                .tabItem {
                    Image("tabicon-book")
                    Text("Recipes")
                }
            
            RipeningStagesView()
                .tabItem {
                    Image("tabicon-avocado")
                    Text("Ripening")
                }
            
            SettingsView()
                .tabItem {
                    Image(.tabiconSettings)
                    Text("Settings")
                }
        } //: TabView
        .tint(.accentColor)
    }
}

#Preview {
    AppView()
}
