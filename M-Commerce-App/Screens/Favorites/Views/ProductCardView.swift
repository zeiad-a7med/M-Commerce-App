//
//  ProductCardView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//

import SwiftData
import SwiftUI

struct ProductCardView: View {
    
    let cornerRadius: CGFloat = 30.0
    let shadowRadius: CGFloat = 7.0
    var product: Product
    @ObservedObject private var favoritesManager = FavoritesManager.shared
    @State var didAppear: Bool = false
    @State var isFavorite: Bool = false
    var body: some View {
//        NavigationLink(destination: {
//            ProductInfoView(productId: product.id)
//        }) {
//            
//            
//        }
        LazyVStack {
            //                CustomNetworkImageView(
            //                    url: URL(
            //                        string:
            //                            url
            //                    )!
            //                )
            AsyncImage(url: URL(string: product.featuredImage?.url ?? "")) {
                phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .empty:
                    Image(systemName: "network.slash")
                        .scaledToFit()
                case .failure(_):
                    Image(systemName: "wifi.slash")
                        .scaledToFit()
                @unknown default:
                    Image(systemName: "circle.slash")
                        .scaledToFit()
                }
            }
            .frame(width: 180, height: 200)
            .cornerRadius(20)
            .overlay(
                FavoriteButtonView(
                    product: product,
                    size: 20
//                        isFavorite: (didAppear) ? isFavorite : favoritesManager.isFavorite(product)
                )
                .padding(20),
                alignment: .topTrailing
            )
            .frame(width: 180, height: 200)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowRadius)
            Text(product.title)
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 190)
            Text(product.vendor ?? "")
                .font(.caption)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            Text("\(product.currency ?? "") \(product.formattedPrice)")
                .font(.subheadline)
                .foregroundStyle(.black)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
        }.onReceive(favoritesManager.$favorites) { _ in
            isFavorite = favoritesManager.isFavorite(product)
            print(isFavorite)
        }.onAppear{
            didAppear = true
        }

    }
    
}

#Preview {
    //    ProductCardView(
    //        product:Product(
    //            id: "1",
    //        url: "https://images.sidearmdev.com/convert?url=https%3a%2f%2fdxbhsrqyrr690.cloudfront.net%2fsidearm.nextgen.sites%2fgeorgiasouthern.sidearmsports.com%2fimages%2f2023%2f9%2f12%2fWilliams-A_23MT_UL_AJH-54.jpeg&type=webp", title: "Ahmed Williams", desc: "saeed el sombori", price: "10")
    //    )
}
