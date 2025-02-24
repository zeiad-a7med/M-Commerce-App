//
//  ProductsView.swift
//  M-Commerce-App
//
//  Created by Usef on 14/02/2025.
//

import SwiftUI

struct ProductsView: View {
    var brandTitle: String
    @State var currentFilter: String = ""
    @State var filterKeySelected: String = "All Products"
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    @StateObject var brandresponse: ProductsViewModel
    init(brandTitle: String) {
        self.brandTitle = brandTitle
        _brandresponse = StateObject(
            wrappedValue: ProductsViewModel(
                first: 10, after: nil, filter: brandTitle))
    }
    var body: some View {

        VStack {
            FilterBar(
                filterItems: [
                    "All Products",
                    "Sale", "Winter",
                    "Spring", "Autumn",
                    "Summer",
                ],
                willFilter: { filter in

                    if filterKeySelected != filter {
                        filterKeySelected = filter
                        filterProducts()
                    }
                })
            if brandresponse.isLoading {
                CustomProgressView()
            } else {
                BrandsGrid(
                    columns: columns,
                    products: brandresponse.products.BrandProducts ?? [],
                    loadMore: {
                        brandresponse.loadMore(query: currentFilter)
                    }
                )
                .overlay(content: {
                    if brandresponse.products.BrandProducts?.count ?? 0 == 0
                        && !brandresponse.isLoading
                    {
                        ContentUnavailableView(
                            "No \"\(filterKeySelected)\" Products Found",
                            systemImage: "square.3.layers.3d.slash",
                            description: Text(
                                "No products found for \(brandTitle) in \(filterKeySelected) filter, try using other filters"
                            ))
                    }
                })
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationBarTitle("Products")
        .toolbar(.hidden,for: .tabBar)
    }

    func filterProducts() {
        if filterKeySelected == "All Products" {
            filterKeySelected = ""
        }
        if filterKeySelected != "" {
            self.brandresponse.fetchProducts(
                first: 20, after: nil,
                query: "\(brandTitle) | \(filterKeySelected)")
            currentFilter = "\(brandTitle) | \(filterKeySelected)"
        } else {
            self.brandresponse.fetchProducts(
                first: 20, after: nil, query: brandTitle)
            currentFilter = brandTitle
        }
    }
}

#Preview {
    ProductsView(brandTitle: "")
}
