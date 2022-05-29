//
//  SFSymbols.swift
//  Goals Tracker by CIC
//
//  Created by Ionut Ciovica on 29/05/2022.
//

import SwiftUI

enum SFSymbol: String, View {
    case edit = "pencil.circle"
    case new = "plus.circle"
    case fitness = "heart.circle"
    case read = "book.circle"
    case sleep = "moon.circle"
    case meditate = "sun.max.circle"
    case food = "leaf.circle"
    
    var body: Image {
        Image(systemName: rawValue)
    }
}
