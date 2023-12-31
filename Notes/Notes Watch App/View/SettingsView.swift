//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Andres Donoso on 26/12/23.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    @AppStorage("lineCount") var lineCount: Int = 1
    
    @State private var value: Float = 1.0
    
    //MARK: - FUNCTIONS
    func update() {
        lineCount = Int(value)
    }
    
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 8) {
            // HEADER
            HeaderView(title: "Settings")
            
            // ACTUAL LINE COUNT
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // SLIDER
            Slider(value: Binding(get: {
                self.value
            }, set: {(newValue) in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .tint(.accent)
        } //: VStack
        .onAppear {
            value = Float(lineCount)
        }
    }
}

#Preview {
    SettingsView()
}
