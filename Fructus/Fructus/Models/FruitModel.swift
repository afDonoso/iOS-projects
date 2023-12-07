//
//  FruitModel.swift
//  Fructus
//
//  Created by Andres Donoso on 5/12/23.
//

import SwiftUI

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
