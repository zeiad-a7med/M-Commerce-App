//
//  ProductCardView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//

import SwiftUI

struct ProductCardView: View {
    @State var isFavorite: Bool = false
    let cornerRadius:CGFloat = 30.0
    let shadowRadius:CGFloat = 7.0
    var body: some View {
        VStack {
            CustomNetworkImageView(
                url: URL(
                    string:
                        "https://images.sidearmdev.com/convert?url=https%3a%2f%2fdxbhsrqyrr690.cloudfront.net%2fsidearm.nextgen.sites%2fgeorgiasouthern.sidearmsports.com%2fimages%2f2023%2f9%2f12%2fWilliams-A_23MT_UL_AJH-54.jpeg&type=webp"
                )!
            )
            .cornerRadius(20)
            .overlay(
                Button(action: {
                    isFavorite = isFavorite ? false : true
                }) {
                    Image(systemName: (isFavorite) ? "heart.fill" : "heart")
                        .foregroundStyle(.red)
                        .frame(alignment: .bottomLeading)
                        .background {
                            Circle()
                                .frame(width: 34, height: 35)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                }
                    .padding(20),
                alignment: .topTrailing
            )
            .frame(width: 180, height: 200)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowRadius)
            Text("Box HeadPhone 234")
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(maxWidth:190)
            Text("Upbox Bag")
                .font(.caption)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            Text("$66.00")
                .font(.subheadline)
                .foregroundStyle(.black)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    ProductCardView()
}
