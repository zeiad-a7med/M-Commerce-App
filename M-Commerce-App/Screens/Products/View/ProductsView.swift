//
//  ProductsView.swift
//  M-Commerce-App
//
//  Created by Usef on 14/02/2025.
//

import SwiftUI

struct ProductsView: View {
    var brandTitle:String
    @State var filterKeySelected: String = "All Products"
    @State var prevFilterKeySelected: String = "dummy"
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())]
    @StateObject var brandProductsArray: ProductsViewModel
    init(brandTitle: String) {
            self.brandTitle = brandTitle
            _brandProductsArray = StateObject(wrappedValue: ProductsViewModel(first: 20, after: nil, filter: brandTitle))
        }
    var body: some View {
            VStack {
                FlatFilterBar(filter: { filter in
                    filterKeySelected = filter
                    if filterKeySelected != prevFilterKeySelected {
                        print(filter)
                        filterProducts()
                        prevFilterKeySelected = filter
                    }
                })
                Spacer()
                BrandsGrid(columns: columns
                  , products: brandProductsArray.products.BrandProducts ?? [])
            }
            .overlay(content: {
                if brandProductsArray.products.BrandProducts?.count ?? 0 == 0 {
                    ContentUnavailableView("No \"\(filterKeySelected)\" Products Found", systemImage: "square.3.layers.3d.slash", description: Text("No products found for \(brandTitle) in \(filterKeySelected) filter, try using other filters"))
                }
            })
            .navigationTitle("Products")
    }
    func filterProducts() {
        if filterKeySelected == "All Products" {
            filterKeySelected = ""
        }
        if filterKeySelected == prevFilterKeySelected {
            return
        }
        if filterKeySelected != "" {
            self.brandProductsArray.fetchProducts(first: 20, after: nil, query: "\(brandTitle) | \(filterKeySelected)")
        }else{
            self.brandProductsArray.fetchProducts(first: 20, after: nil, query: brandTitle)
        }
    }
}

#Preview {
    ProductsView(brandTitle: "Adidas")
}
