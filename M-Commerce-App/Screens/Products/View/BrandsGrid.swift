//
//  BrandsGrid.swift
//  M-Commerce-App
//
//  Created by Usef on 14/02/2025.
//

import SwiftUI

struct BrandsGrid: View {
    var columns: [GridItem]
    var products: [Product]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(products, id: \.id) { product in
                    ProductCardView(product: product)
                        .padding(.top,20)
                }
            }
            
        }
    }
}

#Preview {
    BrandsGrid(columns: [], products: [])
}
