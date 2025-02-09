//
//  ProductCardView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//

import SwiftUI

struct ProductCardView: View {
    var body: some View {
        VStack{
            CustomNetworkImageView(url: URL(string: "https://images.sidearmdev.com/convert?url=https%3a%2f%2fdxbhsrqyrr690.cloudfront.net%2fsidearm.nextgen.sites%2fgeorgiasouthern.sidearmsports.com%2fimages%2f2023%2f9%2f12%2fWilliams-A_23MT_UL_AJH-54.jpeg&type=webp")!)
                .scaledToFill()
                .frame(width: 200,height: 250)
        }
    }
}

#Preview {
    ProductCardView()
}
