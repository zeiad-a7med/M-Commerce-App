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
        toEmail: String? = "zeiadahmed194@gmail.com", subject: String? = "hiii",
        body: String? = "hello"
    ) {

        let sender = Mail.User(
            name: "ZeinShop", email: "zeiadahmed194@gmail.com")
        let recipient = Mail.User(email: "zeiadahmed194@gmail.com")

        let htmlBody = """
            <html>
            <body>
            <h2>Order Receipt Statistics</h2>
            <p><strong>Total Orders:</strong> 1,235</p>
            <p><strong>Total Revenue:</strong> $45,670</p>
            <p><strong>Avg. Order Value:</strong> $37</p>
            <h3>Recent Orders</h3>
            <table border="1">
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Product</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Date</th>
                </tr>
                <tr>
                    <td>#1023</td>
                    <td>John Doe</td>
                    <td>Wireless Headphones</td>
                    <td><img src="https://via.placeholder.com/50"></td>
                    <td>2</td>
                    <td>$120</td>
                    <td>2025-02-25</td>
                </tr>
            </table>
            </body>
            </html>
            """

        // Create an email with the HTML content and set the content type
        let mail = Mail(
            from: sender,
            to: [recipient],
            subject: "Order Receipt Statistics",
            text: "https://itp-newcapital-ios2.myshopify.com/90642579827/orders/86fa9cb09bb9e157db67211e40ac3cf2/authenticate?key=67f2509528fa0cdd809f3ea0c662b763",  // HTML content goes here
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
}


class HTMLFetcher: ObservableObject {
    @Published var htmlContent: String = "Loading..."

    func fetchHTML(from urlString: String) {
       
    }
}
