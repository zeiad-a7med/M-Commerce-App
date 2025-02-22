//
//  PaymentService.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 22/02/2025.
//

import Foundation
protocol OrderCreateService{
    static func createOrder(
        complitionHandler: @escaping (OrderCreateResponse?) -> Void)
}

class PaymentService : OrderCreateService{
    private static func extractVariantID(id: String) -> String? {
            let components = id.components(separatedBy: "/")
            return components.last
    }
    static func ParseOrder() -> [[String: Any]]{
        var lineItems: [[String: Any]] = []
        AuthManager.shared.applicationUser?.cart?.lines?.forEach {line in
            let lineItem: [String: Any] = [
                "variant_id": self.extractVariantID(id: line.variant?.id ?? "") ?? "",
                "quantity": line.quantity ?? 0
            ]
            lineItems.append(lineItem)
        }
        let billingAddress = [
            "first_name": AuthManager.shared.applicationUser?.defaultAddress?.firstName,
            "last_name": AuthManager.shared.applicationUser?.defaultAddress?.lastName,
            "address1": AuthManager.shared.applicationUser?.defaultAddress?.address1,
            "phone":AuthManager.shared.applicationUser?.defaultAddress?.phone,
            "city": AuthManager.shared.applicationUser?.defaultAddress?.city,
            "province": AuthManager.shared.applicationUser?.defaultAddress?.province,
            "country": AuthManager.shared.applicationUser?.defaultAddress?.country,
          "zip":AuthManager.shared.applicationUser?.defaultAddress?.zip
        ]
        let customer = [
            "first_name": AuthManager.shared.applicationUser?.firstName,
          "last_name": AuthManager.shared.applicationUser?.lastName,
            "email": AuthManager.shared.applicationUser?.email
        ]
        let shippingAddress = [
            "first_name": AuthManager.shared.applicationUser?.defaultAddress?.firstName,
            "last_name": AuthManager.shared.applicationUser?.defaultAddress?.lastName,
            "address1": AuthManager.shared.applicationUser?.defaultAddress?.address1,
            "phone":AuthManager.shared.applicationUser?.defaultAddress?.phone,
            "city": AuthManager.shared.applicationUser?.defaultAddress?.city,
            "province": AuthManager.shared.applicationUser?.defaultAddress?.province,
            "country": AuthManager.shared.applicationUser?.defaultAddress?.country,
          "zip":AuthManager.shared.applicationUser?.defaultAddress?.zip
        ]
        var orderData: [[String: Any]] = [
            [
                "order": [
                    "line_items": lineItems,
                    "customer": customer,
                    "billing_address": billingAddress,
                    "shipping_address": shippingAddress,
                    "email": AuthManager.shared.applicationUser?.email ?? "",
                    "transactions": [
                        [
                            "kind": "authorization",
                            "status": "success",
                            "amount": AuthManager.shared.applicationUser?.cart?.cost?.totalAmount?.amount ?? ""
                        ]
                    ],
                    "financial_status": "paid"
                ]
            ]
        ]
       
        return orderData
    }
    static func createOrder(complitionHandler: @escaping (OrderCreateResponse?) -> Void) {
 
    }
    
}
