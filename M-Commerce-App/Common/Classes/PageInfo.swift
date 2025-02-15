//
//  PageInfo.swift
//  M-Commerce-App
//
//  Created by Zeiad on 12/02/2025.
//

import Foundation

struct PageInfo {
    var startCursor: String?
    var endCursor: String?
    var hasNextPage: Bool = false
    var hasPreviousPage: Bool = false
}
