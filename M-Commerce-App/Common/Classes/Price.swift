//
//  Price.swift
//  M-Commerce-App
//
//  Created by Usef on 12/02/2025.
//

import Foundation

struct Price: Codable , Hashable {
    let amount: String?
    let currencyCode: String?
    
    var formattedPrice: String {
        guard let amount = amount else {
            return "0.0"
        }
        let currentRate = CurrencyManager.currentCurrencyRate.value ?? 1.0
        guard let currentPrice = Double(amount) else { return "" }
        let finalPrice = currentPrice * currentRate
        return String(format: "%.2f", finalPrice)
    }
    
    var formattedCurrecyCode: String {
        guard let currencyCode else {
            return "EGP"
        }
        return CurrencyManager.currentCurrencyRate.code ?? currencyCode
    }
    
    
    
}
