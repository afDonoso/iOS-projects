//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Andres Donoso on 29/12/23.
//

import SwiftUI

@main
struct TodoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
