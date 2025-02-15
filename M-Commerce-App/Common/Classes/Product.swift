//
//  Product.swift
//  M-Commerce-App
//
//  Created by Usef on 12/02/2025.
//

import Foundation
import ShopifyAPIKit
import SwiftData

@Model
final class Product{
    var availableForSale: Bool?
    var desc: String?
    var handle: String?
    var id: String
    var isGiftCard: Bool?
    var productType: String?
    var tags: [String]?
    var title: String
    var totalInventory: Int?
    var updatedAt: String?
    var vendor: String?
    var category: String?
    var priceRange: PriceRange?
    var featuredImage: ImgModel?
    var images: [ImgModel]?
    var encodedVariantExistence: String?
    var encodedVariantAvailability: String?
    
    init(availableForSale: Bool? = nil, desc: String? = nil, handle: String? = nil, id: String, isGiftCard: Bool? = nil, productType: String? = nil, tags: [String]? = nil, title: String, totalInventory: Int? = nil, updatedAt: String? = nil, vendor: String? = nil, category: String? = nil, priceRange: PriceRange? = nil, featuredImage: ImgModel? = nil, images: [ImgModel]? = nil, encodedVariantExistence: String? = nil, encodedVariantAvailability: String? = nil) {
        self.availableForSale = availableForSale
        self.desc = desc
        self.handle = handle
        self.id = id
        self.isGiftCard = isGiftCard
        self.productType = productType
        self.tags = tags
        self.title = title
        self.totalInventory = totalInventory
        self.updatedAt = updatedAt
        self.vendor = vendor
        self.category = category
        self.priceRange = priceRange
        self.featuredImage = featuredImage
        self.images = images
        self.encodedVariantExistence = encodedVariantExistence
        self.encodedVariantAvailability = encodedVariantAvailability
    }
    //Getters
    var price: Double {
        get {
            return Double(priceRange?.minVariantPrice.amount ?? "0") ?? 0
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
