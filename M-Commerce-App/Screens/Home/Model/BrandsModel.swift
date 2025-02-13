//
//  BrandsModel.swift
//  M-Commerce-App
//
//  Created by Usef on 12/02/2025.
//

import Foundation

struct BrandsResponse: Codable {
    var collectionCount: String?
    var collections: [Collection]?
    var pageInfo: PageInfo?
}


