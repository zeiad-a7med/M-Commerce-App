//
//  Line.swift
//  M-Commerce-App
//
//  Created by Zeiad on 19/02/2025.
//

import Foundation

class Line : Codable{
    var id: String?
    var variant : ProductVariant?
    var quantity: Int?
    var lineCost: LineCost?
    init(id: String? = nil, variant: ProductVariant? = nil, quantity: Int? = nil, lineCost: LineCost? = nil) {
        self.id = id
        self.variant = variant
        self.quantity = quantity
        self.lineCost = lineCost
    }
}
