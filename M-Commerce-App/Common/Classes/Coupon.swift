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
    @Attribute(.unique) var code: String
    var type: CouponType
    var value: Double
    var title: String
    var image: String
    init(
        code: String, type: CouponType, value: Double, title: String,
        image: String
    ) {
        self.code = code
        self.type = type
        self.value = value
        self.title = title
        self.image = image
    }
}
enum CouponType: String, Codable {
    case fixedAmount
    case percentage
}
