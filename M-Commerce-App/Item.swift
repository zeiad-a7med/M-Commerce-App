//
//  Item.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 12/02/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
