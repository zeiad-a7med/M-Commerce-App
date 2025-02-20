//
//  OrderModel.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import Foundation

struct OrderModel {
    var customer: Customer?
}

struct Customer {
    var id: String?
    var phone: String?
    var email: String?
    var orders: OrderList?
    var displayName: String?
    var addresses: [Address]?
}
struct OrderList {
    var totalCount: String?
    var nodes: [Order]?
}

struct LineItemList : Codable{
    var nodes: [LineItem]?
}

struct LineItem : Codable {
    var title: String?
    var quantity: Int?
    var currentQuantity: Int?
    var variant: OrderProductVariant?
}

struct OrderProductVariant: Codable {
    var id: String?
    var title: String?
    var currentlyNotInStock: Bool?
    var quantityAvailable: Int?
    var requiresShipping: Bool?
    var image: ImgModel?
}
