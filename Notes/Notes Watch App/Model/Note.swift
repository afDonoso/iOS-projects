//
//  Note.swift
//  Notes Watch App
//
//  Created by Andres Donoso on 26/12/23.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
