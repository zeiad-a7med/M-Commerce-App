//
//  ReadMoreTextView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 12/02/2025.
//

import SwiftUI

struct ReadMoreTextView: View {
    let text: String
    var lineLimit = 3
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .lineLimit(isExpanded ? nil : lineLimit)
                .padding(.bottom, 5)

            Button(action: {
                isExpanded.toggle()
            }) {
                Text(isExpanded ? "Read Less" : "Read More")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    ReadMoreTextView(
        text:
            "he product is designed with high-quality materials to ensure durability and longevity. It features an ergonomic design that provides maximum comfort during use. Whether you’re using it for daily activities or special occasions, this product meets all your needs. It is lightweight, easy to carry, and packed with innovative features that set it apart from the competition. Additionally, it comes in various colors and sizes to suit different preferences. With its user-friendly interface and top-notch performance, this product is a must-have for anyone looking for quality and reliability.",
        lineLimit: 2
    )
}
