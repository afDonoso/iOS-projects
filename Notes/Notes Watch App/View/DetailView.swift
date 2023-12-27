//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Andres Donoso on 26/12/23.
//

import SwiftUI

struct DetailView: View {
    //MARK: - PROPERTIES
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented = false
    @State private var isSettingsPresented = false
    
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 3) {
            // HEADER
            HeaderView()
            
            // CONTENT
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            } //: ScrollView
            
            Spacer()
            
            // FOOTER
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented, content: {
                        SettingsView()
                    })
                
                Spacer()
                
                Text("\(index + 1) / \(count)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditsView()
                    })
            } //: HStack
            .foregroundStyle(.secondary)
        } //: VStack
        .padding(3)
    }
}

#Preview {
    let sampleData = Note(id: UUID(), text: "Hello, World!")
    
    return DetailView(note: sampleData, count: 5, index: 1)
}
