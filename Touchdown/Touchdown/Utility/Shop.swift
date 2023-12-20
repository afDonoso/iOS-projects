//
//  Shop.swift
//  Touchdown
//
//  Created by Andres Donoso on 20/12/23.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct = false
    @Published var selectedProduct: Product? = nil
}
