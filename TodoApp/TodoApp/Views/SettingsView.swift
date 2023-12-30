//
//  SettingsView.swift
//  TodoApp
//
//  Created by Andres Donoso on 30/12/23.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings()
    @State private var isThemeChanged = false
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                //MARK: - FORM
                
                Form {
                    //MARK: - SECTION 1
//                    Section {
//                        Picker(selection: $iconSettings.currentIndex) {
//                            ForEach(0..<iconSettings.iconNames.count) { index in
//                                HStack {
//                                    Image(uiImage: UIImage(named: iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
//                                        .renderingMode(.original)
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 44, height: 44)
//                                        .clipShape(.rect(cornerRadius: 8))
//                                    
//                                    Spacer()
//                                        .frame(width: 8)
//                                    
//                                    Text(iconSettings.iconNames[index] ?? "Blue")
//                                        .frame(alignment: .leading)
//                                } // HStack
//                            }
//                        } label: {
//                            Text("App Icons")
//                        } //: Picker
//                        .onReceive([iconSettings.currentIndex].publisher.first, perform: { value in
//                            index = self.iconSettings.iconN
//                        })
//
//                    } header: {
//                        Text("Choose the app icon")
//                    }
//                    .padding(.vertical, 3)
                    
                    //MARK: - SECTION 2
                    Section {
                        List {
                            ForEach(themes) { item in
                                Button {
                                    theme.themeSettings = item.id
                                    
                                    UserDefaults.standard.set(theme.themeSettings, forKey: "Theme")
                                    isThemeChanged.toggle()
                                } label: {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundStyle(item.themeColor)
                                        
                                        Text(item.themeName)
                                    }
                                } //: Button
                                .tint(.primary)
                            }
                        }
                    } header: {
                        HStack {
                            Text("Choose the app theme")
                            
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(themes[theme.themeSettings].themeColor)
                        }
                    }
                    .padding(.vertical, 3)

                    
                    //MARK: - SECTION 3
                    Section {
                        FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "https://swiftuimasterclass.com")
                        
                        FormRowLinkView(icon: "link", color: .blue, text: "Twitter", link: "https://twitter.com/robertpetras")
                        
                        FormRowLinkView(icon: "play.rectangle", color: .green, text: "Courses", link: "https://udemy.com/user/robert-petras")
                    } header: {
                        Text("Follow us on social media")
                    }
                    .padding(.vertical, 3)
                    
                    
                    //MARK: - SECTION 4
                    Section {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone/iPad")
                        
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Andrés Donoso")
                        
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    } header: {
                        Text("About the application")
                    }
                    .padding(.vertical, 3)
                    
                } //: Form
                .listStyle(.grouped)
                .environment(\.horizontalSizeClass, .regular)
                
                //MARK: - FOOTER
                Text("Copyright © All rights reserved.\nBetter Apps ♡ Less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundStyle(.secondary)
            } //: VStack
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .background(.colorBackground)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                }
            }
        } //: NavigationView
        .tint(themes[theme.themeSettings].themeColor)
    }
}

#Preview {
    SettingsView()
}
