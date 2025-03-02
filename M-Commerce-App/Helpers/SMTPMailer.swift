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
            name: "Shopio", email: "zeiadahmed194@gmail.com")
        let recipient = Mail.User(email: user?.email ?? "zeiadahmed194@gmail.com")

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
        let currency = orderData["currency"] as? String
        let totalPrice = orderData["current_total_price"] as? String
        var tableRows = ""
        for item in lineItems {
            let name = item["name"] as? String ?? "Unknown"
            let price = item["price"] as? String ?? ""
            let price_set = item["price_set"] as? [String: Any]?
            let shop_money = item["shop_money"] as? [String: Any]
            let cur = "EGP"
            let quantity = item["quantity"] as? Int ?? 0
            tableRows +=
                "<tr><td>\(name)</td></tr> <tr><td>price: \(cur)\(price)</td></tr> <tr><td>quantity: \(quantity)</td></tr><tr><td></td></tr>"
        }

        return """
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Order Details</title>
            </head>
            <body>
                <div>
                    <table>
                        <tbody>
                            \(tableRows)
                        </tbody>
                    </table>
                    <h3>Total price : \(currency ?? "EGP") \(totalPrice ?? "0")</h3>
                    <a class="status-link" href="\(orderStatusURL)" target="_blank">View Order Status</a>
                </div>
            </body>
            </html>
            """
    }

}
