//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Andres Donoso on 19/12/23.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
