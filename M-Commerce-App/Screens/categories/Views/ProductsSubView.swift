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
                    ProductCardView(product:
                                        filteredProducts[index])
                    if index + 1 < filteredProducts.count {
                        ProductCardView(product: filteredProducts[index + 1])
                    }else{
                        ProductCardView(product: filteredProducts[index])
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
