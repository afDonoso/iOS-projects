//
//  SettingsView.swift
//  Avocados
//
//  Created by Andres Donoso on 27/12/23.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    @State private var enableNotifications = true
    @State private var backgroundRefresh = false
    
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
            //MARK: - HEADER
            VStack(spacing: 5) {
                Image(.avocado)
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100)
                    .shadow(color: .colorBlackTransparentLight, radius: 8, y: 4)
                
                Text("Avocados")
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                .foregroundStyle(.colorGreenAdaptive)
            } // Header
            
            Form {
                //MARK: - SECTION #1
                Section {
                    Toggle(isOn: $enableNotifications) {
                        Text("Enable notifications")
                    }
                    
                    Toggle(isOn: $backgroundRefresh, label: {
                        Text("Background refresh")
                    })
                } header: {
                    Text("General Settings")
                }

                //MARK: - SECTION #2
                Section {
                    if enableNotifications {
                        HStack {
                            Text("Product")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("Avocado Recipes")
                        }
                        
                        HStack {
                            Text("Compatibility")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("iPhone & iPad")
                        }
                        
                        HStack {
                            Text("Developer")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("Andrés Donoso")
                        }
                        
                        HStack {
                            Text("Designer")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("Robert Petras")
                        }
                        
                        HStack {
                            Text("Website")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("swiftuimasterclass.com")
                        }
                        
                        HStack {
                            Text("Version")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("1.0.0")
                        }
                    } else {
                        HStack {
                            Text("Personal message")
                                .foregroundStyle(.gray)
                            
                            Spacer()
                            
                            Text("Happy Coding!")
                        }
                    }
                    
                    
                } header: {
                    Text("Application")
                }

            }
        } //: VStack
        .frame(maxWidth: 640)
    }
}

#Preview {
    SettingsView()
}
