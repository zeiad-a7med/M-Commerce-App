//
//  DetailsModel.swift
//  M-Commerce-App
//
//  Created by Usef on 20/02/2025.
//

import Foundation

struct DetailsModel {
    var customer: Customer?
    var success : Bool?
    var message : String?
}

struct OrderProductVariant: Codable {
    var id: String?
    var title: String?
    var currentlyNotInStock: Bool?
    var quantityAvailable: Int?
    var requiresShipping: Bool?
    var image: ImgModel?
    var product:OrderedProduct?
}
