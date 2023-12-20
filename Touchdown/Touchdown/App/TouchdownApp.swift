//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Andres Donoso on 19/12/23.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
