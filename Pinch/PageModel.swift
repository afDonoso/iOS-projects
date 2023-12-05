//
//  PageModel.swift
//  Pinch
//
//  Created by Andres Donoso on 4/12/23.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-\(imageName)"
    }
}
