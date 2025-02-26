//
//  SMTPMailer.swift
//  M-Commerce-App
//
//  Created by Zeiad on 25/02/2025.
//

import Foundation
import SwiftSMTP

class SMTPMailer {
    static func sendCompitionEmail(
        user: ApplicationUser?,
        data: Data?
    ) {

        guard let data = data else {
            return
        }

        var htmlBody : String?

        do {
            if let json = try JSONSerialization.jsonObject(
                with: data, options: []) as? [String: Any]
            {
                htmlBody = generateOrderDetailsHTML(orderData: json["order"] as? [String: Any])
            }
        } catch {
            return
        }

        

        let sender = Mail.User(
            name: "ZeinShop", email: "zeiadahmed194@gmail.com")
        let recipient = Mail.User(email: "zeiadahmed194@gmail.com")

        // Create an email with the HTML content and set the content type
        let mail = Mail(
            from: sender,
            to: [recipient],
            subject: "Order Receipt Statistics",
            text:htmlBody ?? "",  // HTML content goes here
            additionalHeaders: ["Content-Type": "text/html; charset=utf-8"]  // This tells the email client to render as HTML
        )

        // Configure SMTP
        let smtp = SMTP(
            hostname: "smtp-relay.brevo.com",
            email: "86a8fa001@smtp-brevo.com",
            password: "53CYvnmGwzOgB2Hr",
            port: 587,
            tlsMode: .ignoreTLS
        )

        // Send the email
        smtp.send(mail) { error in
            if let error = error {
                print("Email failed to send: \(error.localizedDescription)")
            } else {
                print("Email sent successfully!")
            }
        }
    }

    static func generateOrderDetailsHTML(orderData: [String: Any]?) -> String? {
        guard let orderData = orderData,
            let orderStatusURL = orderData["order_status_url"] as? String,
            let lineItems = orderData["line_items"] as? [[String: Any]]
        else {
            return nil
        }

        var tableRows = ""
        for item in lineItems {
            let name = item["name"] as? String ?? "Unknown"
            let price = item["price"] as? String ?? ""
            let price_set = item["price_set"] as? [String: Any]?
            let shop_money = item["shop_money"] as? [String: Any]
            let cur = "EGP"
            let quantity = item["quantity"] as? Int ?? 0
            tableRows +=
                "<tr><td>\(name)</td><td>\(cur)\(price)</td><td>\(quantity)</td></tr>"
        }

        return """
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Order Details</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; padding: 20px; }
                    .container { max-width: 600px; margin: auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); }
                    table { width: 100%; border-collapse: collapse; }
                    .status-link { display: block; margin-top: 15px; text-align: center; font-size: 16px; color: #007bff; text-decoration: none; }
                </style>
            </head>
            <body>
                <div class="container">
                    <h2>Order Details</h2>
                    <table>
                        <thead>
                            <tr><th>Product Name</th><th>Price</th><th>Quantity</th></tr>
                        </thead>
                        <tbody>
                            \(tableRows)
                        </tbody>
                    </table>
                    <a class="status-link" href="\(orderStatusURL)" target="_blank">View Order Status</a>
                </div>
            </body>
            </html>
            """
    }

}

class HTMLFetcher: ObservableObject {
    @Published var htmlContent: String = "Loading..."

    func fetchHTML(from urlString: String) {

    }
}
