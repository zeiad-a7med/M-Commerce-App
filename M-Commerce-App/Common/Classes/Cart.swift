//
//  Cart.swift
//  M-Commerce-App
//
//  Created by Zeiad on 19/02/2025.
//

import Foundation
struct Cart : Codable {
    var id : String?
    var checkoutUrl : String?
    var note : String?
    var totalQuantity : Int?
    var lines : [Line]?
    var cost : Cost?
    var discount : Double?
    var createdAt : String?
    var updatedAt : String?
}

