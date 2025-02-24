//
//  SearchModel.swift
//  M-Commerce-App
//
//  Created by Usef on 24/02/2025.
//

import Foundation

struct SearchModel: Codable {
    var products: [SearchData]
}

struct SearchData: Codable {
    var id: String
    var title: String
    var productType: String
    var vendor: String
    var totalInventory:Int
    var description:String
    var imgUrl:String
    var priceRange:PriceRange?
}
