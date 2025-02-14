//
//  ProductsSubView.swift
//  M-Commerce-App
//
//  Created by Usef on 10/02/2025.
//
//Text(filteredProd.first?.images?[0].originalSrc ?? "").padding()
import SwiftUI

struct ProductsSubView: View {
    var filteredProducts: [Product]
    var body: some View {
        LazyVStack{
            ForEach(Array(stride(from: 0, to: filteredProducts.count, by: 2)), id: \.self) { index in
                HStack{
                    ProductCardView(url:
                                        filteredProducts[index].images?[0].url ?? "", title: filteredProducts[index].title ?? "", desc: filteredProducts[index].vendor ?? "", price: filteredProducts[index].priceRange?.minVariantPrice.amount ?? "0")
                    if index + 1 < filteredProducts.count {
                        ProductCardView(url: filteredProducts[index + 1].images?[0].originalSrc ?? "", title: filteredProducts[index + 1].title ?? "", desc: filteredProducts[index + 1].vendor ?? "", price: filteredProducts[index + 1].priceRange?.minVariantPrice.amount ?? "0")
                    }else{
                        ProductCardView(url: filteredProducts[index].images?.first?.url ?? "", title: filteredProducts[index].title ?? "", desc: filteredProducts[index].vendor ?? "", price: filteredProducts[index].priceRange?.minVariantPrice.amount ?? "0").hidden()
                    }
                }
            }
        }
        .padding(5)
    }
}

#Preview {
    ProductsSubView(filteredProducts: [Product]())
}
