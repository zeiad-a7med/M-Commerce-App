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
final class ApplicationUser{
    @Attribute(.unique) var id: String
    var accessToken: String?
    var accessTokenExpiresAt: String?
    var displayName: String?
    var email: String?
    var firstName: String?
    var lastName: String?
    var numberOfOrders: Int?
    var phone: String?
    var addresses: [Address]?
    var defaultAddress: Address?
    var orders: [Order]?
    init(id: String, accessToken: String? = nil,accessTokenExpiresAt: String? = nil, displayName: String? = nil, email: String? = nil, firstName: String? = nil, lastName: String? = nil, numberOfOrders: Int? = nil, phone: String? = nil, addresses: [Address]? = nil, defaultAddress: Address? = nil, orders: [Order]? = nil) {
        self.id = id
        self.accessToken = accessToken
        self.accessTokenExpiresAt = accessTokenExpiresAt
        self.displayName = displayName
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.numberOfOrders = numberOfOrders
        self.phone = phone
        self.addresses = addresses
        self.defaultAddress = defaultAddress
        self.orders = orders
    }
}
