//
//  Order.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import Foundation
struct Order: Codable {
    var id: String?
    var cancelReason: String?
    var currencyCode: String?
    var customerLocale: String?
    var edited: Bool?
    var name: String?
    var phone: String?
    var email: String?
    var financialStatus: String?
    var fulfillmentStatus: String?
    var orderNumber: Int?
    var processedAt: String?
}
