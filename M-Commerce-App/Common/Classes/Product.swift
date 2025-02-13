//
//  Product.swift
//  M-Commerce-App
//
//  Created by Usef on 12/02/2025.
//

import Foundation
import ShopifyAPIKit

struct Product: Codable {
    let availableForSale: Bool
    let description: String
    let handle: String
    let id: String
    let isGiftCard: Bool
    let productType: String
    let tags: [String]
    let title: String
    let totalInventory: Int
    let updatedAt: String
    let vendor: String
    let category: String?
    let priceRange: PriceRange
    let featuredImage: ImgModel
    let images: [ImgModel]
    let encodedVariantExistence: String
    let encodedVariantAvailability: String
    
    //Getters
    var price: Double {
        get {
            return Double(priceRange.minVariantPrice.amount) ?? 0
        }
    }
    var formattedPrice: String {
        get {
            return String(format: "%.2f", price)
        }
    }
    var currency: String? {
        get {
            return priceRange.minVariantPrice.currencyCode
        }
    }
}
