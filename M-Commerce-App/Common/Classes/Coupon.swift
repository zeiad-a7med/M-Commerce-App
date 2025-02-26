//
//  ApplicationUser.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import Foundation
import ShopifyAPIKit
import SwiftData

@Model
final class Coupon {
    @Attribute(.unique) var id: String
    var code: String
    var price_rule_id: String
    var type: CouponType
    var value: Double
    var image: String
    init(
        id: String, code: String, price_rule_id: String, type: CouponType,
        value: Double,
        image: String
    ) {
        self.id = id
        self.code = code
        self.price_rule_id = price_rule_id
        self.type = type
        self.value = value
        self.image = image
    }
}
enum CouponType: String, Codable {
    case fixedAmount
    case percentage
}
