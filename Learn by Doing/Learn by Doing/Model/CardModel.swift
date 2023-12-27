//
//  CardModel.swift
//  Learn by Doing
//
//  Created by Andres Donoso on 26/12/23.
//

import SwiftUI

//MARK: - CARD MODEL
struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
