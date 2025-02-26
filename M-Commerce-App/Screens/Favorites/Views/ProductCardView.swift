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

        VStack {
            let defaultURL = URL(string: "https://m.media-amazon.com/images/I/51aRcLwwKAL._AC_UL1500_.jpg")!
            let imageURL = URL(string: product.featuredImage?.url ?? "https://m.media-amazon.com/images/I/51aRcLwwKAL._AC_UL1500_.jpg") ?? defaultURL
            CustomNetworkImageView(url: imageURL)
            .frame(width: 180, height: 180)
            .cornerRadius(20)
            .onTapGesture {
                NavigationManager.shared.push(.product(id: product.id))
            }
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
