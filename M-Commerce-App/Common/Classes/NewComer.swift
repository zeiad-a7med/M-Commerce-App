//
//  NewCommer.swift
//  M-Commerce-App
//
//  Created by Zeiad on 25/02/2025.
//

import Foundation
import SwiftData

@Model
final class NewComer{
    var isNewComer: Bool?
    init(isNewComer: Bool) {
        self.isNewComer = isNewComer
    }
}

