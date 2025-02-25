//
//  CustomSearchView.swift
//  M-Commerce-App
//
//  Created by Usef on 24/02/2025.
//

import SwiftUI

struct CustomSearchView: View {

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @StateObject var modelView: SearchViewModel = SearchViewModel(
        filterProduct: "")
    @Binding var searchText: String
    @Binding var mainFilter: String?
    //    @State var subFilter: String?
    var body: some View {
        VStack {
            if modelView.filteredProducts.products.isEmpty {

                ContentUnavailableView(
                    "There is no products", systemImage: "exclamationmark.magnifyingglass",
                    description: Text(
                        "There is no products with '\(searchText)' in our store"
                    )).padding(.top,100)

            } else {
                LazyVGrid(columns: columns, spacing: 10) {

                    ForEach(modelView.filteredProducts.products, id: \.id) {
                        product in
                        ProductCardView(
                            product: Product(
                                id: product.id, title: product.title,
                                vendor: product.vendor,
                                priceRange: product.priceRange,
                                featuredImage: ImgModel(url: product.imgUrl))
                        )
                        .onTapGesture {
                            NavigationManager.shared.push(
                                .product(id: product.id))
                        }
                    }

                }
            }
        }
        .onChange(
            of: searchText,
            {
                modelView.searchOnProduct(
                    filterProduct: "\(mainFilter ?? "") | \(searchText)")
            })

    }
}

#Preview {
    //    CustomSearchView(searchText: <#Binding<String>#>)
}
