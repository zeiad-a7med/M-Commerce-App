//
//  PurchaseRule.swift
//  M-Commerce-App
//
//  Created by Zeiad on 25/02/2025.
//

import Foundation
class PurchaseRule{
    static private let baseProductPurchaseLimit: Int = 6
    static func ProductPurchaseLimit(productQuantity:Int)->Int{
        if(productQuantity > baseProductPurchaseLimit){
            return baseProductPurchaseLimit
        }else{
            return productQuantity
        }
    }
}
