//
//  Variant.swift
//  M-Commerce-App
//
//  Created by Zeiad on 18/02/2025.
//

import Foundation
struct ProductVariant: Codable , Hashable{
    var availableForSale : Bool?
    var barcode : String?
    var currentlyNotInStock : Bool?
    var id : String?
    var quantityAvailable : Int?
    var requiresComponents : Bool?
    var requiresShipping : Bool?
    var sku : String?
    var taxable : Bool?
    var title : String?
    var weight : Double?
    var weightUnit : String?
    var image : ImgModel?
    var price : Price?
    var priceV2 : Price?
    var quantityRule : QuantityRule?
}

