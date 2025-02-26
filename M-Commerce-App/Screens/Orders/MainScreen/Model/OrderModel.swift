//
//  OrderModel.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import Foundation

struct OrderModel {
    var customer: Customer?
    var success : Bool?
    var message : String?
}

struct Customer {
    var id: String?
    var phone: String?
    var email: String?
    var orders: OrderList?
    var displayName: String?
    var addresses: [Address]?
    var numberOfOrders:String?
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
    var price:Price?
    var product:OrderedProduct?
}



struct OrderedProduct: Codable {
    var id: String?
    var productType: String?
    var title: String?
    var totalInventory:Int?
    var vendor: String?
}
