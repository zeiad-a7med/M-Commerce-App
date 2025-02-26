//
//  CategoriesModel.swift
//  M-Commerce-App
//
//  Created by Usef on 13/02/2025.
//

import Foundation

struct CategoriesResponse {
    var categoryProducts: [Product]?
    var pageInfo: PageInfo?
    var success: Bool?
    var message: String?
}
