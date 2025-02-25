//
//  PaymentService.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 22/02/2025.
//

import Foundation

protocol OrderCreateService {
    static func createOrder(
        complitionHandler: @escaping (OrderCreateResponse?) -> Void)
}

class PaymentService: OrderCreateService {
    private static func extractVariantID(id: String) -> String? {
        let components = id.components(separatedBy: "/")
        return components.last
    }
    static func ParseOrder() -> [String: Any] {
        var lineItems: [[String: Any]] = []
        AuthManager.shared.applicationUser?.cart?.lines?.forEach { line in
            let lineItem: [String: Any] = [
                "variant_id": self.extractVariantID(id: line.variant?.id ?? "")
                    ?? "",
                "quantity": line.quantity ?? 0,
            ]
            lineItems.append(lineItem)
        }
        let firstName: String =
            AuthManager.shared.applicationUser?.defaultAddress?.firstName ?? ""
        let lastName: String =
            AuthManager.shared.applicationUser?.defaultAddress?.lastName ?? ""
        let address1: String =
            AuthManager.shared.applicationUser?.defaultAddress?.address1 ?? ""
        let phone: String =
            AuthManager.shared.applicationUser?.defaultAddress?.phone ?? ""
        let city: String =
            AuthManager.shared.applicationUser?.defaultAddress?.city ?? ""
        let province: String =
            AuthManager.shared.applicationUser?.defaultAddress?.province
            ?? "province"
        let country: String =
            AuthManager.shared.applicationUser?.defaultAddress?.country ?? ""
        let zip: String =
            AuthManager.shared.applicationUser?.defaultAddress?.zip ?? ""
        var amount: String =
            AuthManager.shared.applicationUser?.cart?.cost?.totalAmount?.amount
            ?? ""
        let couponCode: String? = AuthManager.shared.applicationUser?.cart?.cost?.couponCode
        var discount : Double = 0
        if(AuthManager.shared.applicationUser?.cart?.cost?.couponCode != nil){
            for item in Constants.coupons {
                if item.code == couponCode {
                    if item.type == .percentage {
                        discount = (Double(amount) ?? 0) * ((item.value) / 100)
                    } else {
                        discount = (Double(amount) ?? 0) - (item.value)
                    }
                    break
                }
            }
        }
        
        
        let billingAddress = [
            "first_name": firstName,
            "last_name": lastName,
            "address1": address1,
            "phone": phone,
            "city": city,
            "province": province,
            "country": country,
            "zip": zip,
        ]
        let email = AuthManager.shared.applicationUser?.email ?? ""
        let customer = [
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
        ]
        let orderData: [String: Any] = [

            "order": [
                "line_items": lineItems,
                "customer": customer,
                "billing_address": billingAddress,
                "shipping_address": billingAddress,
                "email": email,
                "transactions": [
                    [
                        "kind": "authorization",
                        "status": "success",
                        "amount": (Double(amount) ?? 0.0) - discount,
                    ]
                ],
                "financial_status": "paid",
            ]

        ]

        return orderData
    }
    static func createOrder(
        complitionHandler: @escaping (OrderCreateResponse?) -> Void
    ) {
        guard
            let url = URL(
                string:
                    "https://itp-newcapital-ios2.myshopify.com/admin/api/2025-01/orders.json"
            )
        else { return }
        let token = "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"
        guard
            let jsonData = try? JSONSerialization.data(
                withJSONObject: ParseOrder(), options: [])
        else {
            complitionHandler(
                OrderCreateResponse(
                    success: false,
                    message: "Couldnt parse to json"
                ))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "X-Shopify-Access-Token")
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {

                if let error = error {
                    complitionHandler(
                        OrderCreateResponse(
                            success: false, message: error.localizedDescription)
                    )
                    return
                }
                if let data = data {
                    let responseString = String(data: data, encoding: .utf8)
                    print("📨 Response: \(responseString ?? "No response")")
                }

                if let httpResponse = response as? HTTPURLResponse {
                    if (httpResponse.statusCode == 201 || httpResponse.statusCode == 200) {
                        complitionHandler(
                            OrderCreateResponse(
                                success: true,
                                message: nil
                            ))
                    } else {
                        complitionHandler(
                            OrderCreateResponse(
                                success: false,
                                message:
                                    "http Error Code :\(httpResponse.statusCode)"
                            ))
                    }
                }

            }
        }.resume()

    }

}
