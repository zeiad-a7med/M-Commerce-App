//
//  Cost.swift
//  M-Commerce-App
//
//  Created by Zeiad on 19/02/2025.
//

import Foundation

struct Cost: Codable {
    var subtotalAmountEstimated: Bool?
    var totalAmountEstimated: Bool?
    var totalDutyAmountEstimated: Bool?
    var totalTaxAmountEstimated: Bool?
    var checkoutChargeAmount: Price?
    var totalAmount: Price?
    var subtotalAmount: Price?
    var totalDutyAmount: Price?
    var totalTaxAmount: Price?
    var couponCode: String?
}
