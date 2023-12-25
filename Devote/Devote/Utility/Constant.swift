//
//  Constant.swift
//  Devote
//
//  Created by Andres Donoso on 20/12/23.
//

import SwiftUI

//MARK: - FORMATTER
let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

//MARK: - UI
var backgroundGradient: LinearGradient {
    return LinearGradient(
        colors: [.pink, .blue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

//MARK: - UX
let feedback = UINotificationFeedbackGenerator()
