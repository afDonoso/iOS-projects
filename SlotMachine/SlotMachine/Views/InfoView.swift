//
//  InfoView.swift
//  SlotMachine
//
//  Created by Andres Donoso on 28/12/23.
//

import SwiftUI

struct InfoView: View {
    //MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "Andrés Donoso")
                    FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
                    FormRowView(firstItem: "Music", secondItem: "Dan Lebowits")
                    FormRowView(firstItem: "Website", secondItem: "swiftuimasterclass.com")
                    FormRowView(firstItem: "Copyright", secondItem: "© 2020 All rights reserved.")
                        FormRowView(firstItem: "Version", secondItem: "1.0.0")
                } header: {
                    Text("About the application")
                }
            }
            .font(.system(.body, design: .rounded))
        } //: VStack
        .padding(.top, 40)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                audioPlayer?.stop()
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.title)
            })
            .padding(.top, 30)
            .padding(.trailing, 20)
            .tint(.secondary)
        }
        .onAppear {
            playSound(sound: "background-music", type: "mp3")
        }
    }
}

struct FormRowView: View {
    //MARK: - PROPERTIES
    var firstItem: String
    var secondItem: String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundStyle(.gray)
            
            Spacer()
            
            Text(secondItem)
        }
    }
}

#Preview {
    InfoView()
}
