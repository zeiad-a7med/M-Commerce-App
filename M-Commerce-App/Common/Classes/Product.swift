//
//  Product.swift
//  M-Commerce-App
//
//  Created by Usef on 12/02/2025.
//

import Foundation
import ShopifyAPIKit

struct Product {
    var availableForSale: Bool?
    var desc: String?
    var handle: String?
    var id: String?
    var isGiftCard: Bool?
    var productType: String?
    var tags: [String]?
    var title: String?
    var totalInventory: Int?
    var updatedAt: String?
    var vendor: String?
    var category: String?
    var priceRange: PriceRange?
    var featuredImage: ImgModel?
    var images: [ImgModel]?
    var encodedVariantExistence: String?
    var encodedVariantAvailability: String?

    //Getters
    var price: Double {
        get {
            return Double(priceRange!.minVariantPrice.amount!) ?? 0
        }
    }
    var formattedPrice: String {
        get {
            return String(format: "%.2f", price)
        }
    }
    var currency: String? {
        get {
            return priceRange?.minVariantPrice.currencyCode
        }
    }
}
