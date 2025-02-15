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
    var loadMore: ()->Void
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(products, id: \.id) { product in
                    ProductCardView(product: product)
                        .padding(.top,20)
                        .onAppear() {
                            if product.id == products.last?.id {
                                print("loading more...!")
                                loadMore()
                            }
                        }
                }
            }
            
        }
    }
}

#Preview {
    BrandsGrid(columns: [], products: [], loadMore: {
        print("loading more...!")
    })
}
