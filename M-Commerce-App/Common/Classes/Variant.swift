//
//  Variant.swift
//  M-Commerce-App
//
//  Created by Zeiad on 18/02/2025.
//

import Foundation
struct ProductVariant: Codable , Hashable{
    var id : String?
    var title : String?
    var image : ImgModel?
    var barcode : String?
    var availableForSale : Bool?
    var currentlyNotInStock : Bool?
    var quantityAvailable : Int?
    var requiresComponents : Bool?
    var requiresShipping : Bool?
    var sku : String?
    var taxable : Bool?
    var weight : Double?
    var weightUnit : String?
    var price : Price?
    var priceV2 : Price?
    var quantityRule : QuantityRule?
    //Fields related to the main product
    var productId : String?
    var productTitle : String?
    var productVendor : String?
}

