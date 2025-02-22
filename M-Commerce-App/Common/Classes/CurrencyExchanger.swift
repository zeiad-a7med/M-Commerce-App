//
//  Currency.swift
//  M-Commerce-App
//
//  Created by Usef on 21/02/2025.
//

import Foundation
import SwiftData

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

@Model
final class CurrencyRate: Codable {
//    var id: UUID
    var code: String?
    var value: Double?
    
    init(code: String? = nil, value: Double? = nil) {
//        self.id = id
        self.code = code
        self.value = value
    }
        enum CodingKeys: String, CodingKey {
            case  code, value
        }

        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
//            self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
            self.code = try container.decodeIfPresent(String.self, forKey: .code)
            self.value = try container.decodeIfPresent(Double.self, forKey: .value)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
//            try container.encode(id, forKey: .id)
            try container.encodeIfPresent(code, forKey: .code)
            try container.encodeIfPresent(value, forKey: .value)
        }
    
}
