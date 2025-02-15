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
    var url: String
    var title: String
    var desc: String
    var price:String
    var body: some View {
        NavigationLink (destination: {
            ProductInfoView()
        }){
            VStack {
//                CustomNetworkImageView(
//                    url: URL(
//                        string:
//                            url
//                    )!
//                )
                AsyncImage(url: URL(string: url)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                        case .empty:
                            Image(systemName: "Placeholder Image")
                                .scaledToFit()
                        case .failure(_):
                            Image(systemName: "Error Image")
                                .scaledToFit()
                        @unknown default:
                            Image(systemName: "Placeholder Image")
                                .scaledToFit()
                        }
                    }
                    .frame(width: 180, height: 200)
                .cornerRadius(20)
                .overlay(
                    FavoriteButtonView(
                        size: 20
                    )
                    .padding(20),
                    alignment: .topTrailing
                )
                .frame(width: 180, height: 200)
                .cornerRadius(cornerRadius)
                .shadow(radius: shadowRadius)
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth:190)
                Text(desc)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                Text(price)
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
            }
        }

    }
}


#Preview {
    ProductCardView(url: "https://images.sidearmdev.com/convert?url=https%3a%2f%2fdxbhsrqyrr690.cloudfront.net%2fsidearm.nextgen.sites%2fgeorgiasouthern.sidearmsports.com%2fimages%2f2023%2f9%2f12%2fWilliams-A_23MT_UL_AJH-54.jpeg&type=webp", title: "Ahmed Williams", desc: "saeed el sombori", price: "10")
}
