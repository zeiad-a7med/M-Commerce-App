//
//  ProductsSubView.swift
//  M-Commerce-App
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI

struct ProductsSubView: View {
    var filteredProducts: [Product]
    var loadMore: () -> Void
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var lastItemID: String?
    
    var body: some View {
//        ScrollViewReader { proxy in
//            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(filteredProducts, id: \.id) { product in
                        ProductCardView(product: product)
                            .id(product.id)
                            .onAppear {
                                checkIfNeedMoreData(currentProduct: product)
                            }
                    }
                }
                .padding(5)
//                .onChange(of: filteredProducts.count) { _ in
//                    scrollToLastItem(proxy: proxy)
//                }
//            }
//        }
    }
    
    private func checkIfNeedMoreData(currentProduct: Product) {
        guard let lastProduct = filteredProducts.last else { return }
        if currentProduct.id == lastProduct.id {
            lastItemID = lastProduct.id
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                loadMore()
            }
        }
    }
    
//    private func scrollToLastItem(proxy: ScrollViewProxy) {
//        guard let lastID = lastItemID else { return }
//        DispatchQueue.main.async {
//            withAnimation (.spring){
//                proxy.scrollTo(lastID, anchor: .bottom)
//            }
//        }
//    }
}

#Preview {
    ProductsSubView(filteredProducts: [Product](), loadMore: {
        print("loading more.......!")
    })
}
