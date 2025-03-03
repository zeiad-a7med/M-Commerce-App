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
    @Attribute(.unique) var id: String
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
    var variants: [ProductVariant]?
    var variantsCount : VariantsCount?
    
    init(availableForSale: Bool? = nil, desc: String? = nil, handle: String? = nil, id: String, isGiftCard: Bool? = nil, productType: String? = nil, tags: [String]? = nil, title: String, totalInventory: Int? = nil, updatedAt: String? = nil, vendor: String? = nil, category: String? = nil, priceRange: PriceRange? = nil, featuredImage: ImgModel? = nil, images: [ImgModel]? = nil, encodedVariantExistence: String? = nil, encodedVariantAvailability: String? = nil, variants: [ProductVariant]? = nil, variantsCount: VariantsCount? = nil) {
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
        self.variants = variants
        self.variantsCount = variantsCount
    }
    //Getters
    var formattedPrice: String {
        get {
            let currencyRate = CurrencyManager.currentCurrencyRate.value ?? 1.0
            guard let minValue = Double(priceRange?.minVariantPrice.amount ?? "") else { return "" }
            let currentMinValue = currencyRate * minValue
            if(priceRange?.minVariantPrice.amount == priceRange?.maxVariantPrice.amount){
                return String(format: "%.2f", currentMinValue)
            }else{
                guard let maxValue = Double(priceRange?.maxVariantPrice.amount ?? "") else { return "" }
                let currentMinValue = currencyRate * maxValue
                return "\(currentMinValue) - \(currentMinValue)"
            }
        }
    }
    var currency: String? {
        get {
            return CurrencyManager.currentCurrencyRate.code ?? priceRange?.minVariantPrice.currencyCode
        }
    }
}
