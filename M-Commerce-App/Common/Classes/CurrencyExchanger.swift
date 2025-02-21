//
//  Currency.swift
//  M-Commerce-App
//
//  Created by Usef on 21/02/2025.
//

import Foundation

struct CurrencyModel: Codable {
    var meta: LastUpdatedAt?
    var data: [String: CurrencyRate]?
}

struct LastUpdatedAt: Codable {
    var lastUpdatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedAt = "last_updated_at"
    }
}

struct CurrencyRate: Codable {
    var code: String?
    var value: Double?
}
