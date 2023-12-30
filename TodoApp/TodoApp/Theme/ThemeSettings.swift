//
//  ThemeSettings.swift
//  TodoApp
//
//  Created by Andres Donoso on 30/12/23.
//

import SwiftUI

class ThemeSettings: ObservableObject {
    @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(themeSettings, forKey: "Theme")
        }
    }
}
