//
//  ProductsSubView.swift
//  M-Commerce-App
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI
import ApolloAPI

struct ProductsSubView: View {
    @StateObject var cViewModel: CategoriesViewModel = CategoriesViewModel(
        first: 20, after: nil, filter: "")
    @Binding var filterString: String
    var SubFiltersArray: [String]
    @Binding var subFilterIndex: Int
    @Binding var filterType: String
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var lastItemID: String?
    @Binding var isSearchActive: Bool
    @Binding var searchText: String
    @State var mainFilter:String?
    @Binding var sliderAsPrice:String
    var body: some View {

        if isSearchActive {
            CustomSearchView(searchText: $searchText ,
                             mainFilter: $mainFilter)
        }else {
            if !cViewModel.isLoading {
                if let filteredProducts = cViewModel.categories
                    .categoryProducts
                {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(filteredProducts, id: \.id) { product in
                            ProductCardView(product: product)
                                .id(product.id)
                                .onAppear {
                                    checkIfNeedMoreData(currentProduct: product)
                                }
                                .onTapGesture {
                                    NavigationManager.shared.push(
                                        .product(id: product.id))
                                }
                        }
                    }
                    .onChange(
                        of: filterType,
                        { oldValue, newValue in
                            filter()
                        }
                    )
                    .onChange(
                        of: subFilterIndex,
                        { oldValue, newValue in
                            filter()
                        }
                    )
                    .onChange(
                        of: sliderAsPrice,
                        { oldValue, newValue in
                            filter()
                        }
                    )

                    .padding(5)
                    .overlay(content: {
                        if cViewModel.categories.categoryProducts?.count ?? 0 == 0
                            && !cViewModel.isLoading
                        {
                            let msg = "No Products Found"
                            let desc = Text(
                                "No  Products Found of type \"\(SubFiltersArray[subFilterIndex] == "" ? "" : "\(SubFiltersArray[subFilterIndex])")\" in \"\(filterType) category\", try using other filters"
                            )
                            let img = "square.3.layers.3d.slash"
                            ContentUnavailableView(
                                msg, systemImage: img, description: desc)
                        }
                    })
                }

            } else {
                CustomProgressView()
            }

        }
    }

    private func checkIfNeedMoreData(currentProduct: Product) {
        guard
            let lastProduct = cViewModel.categories
                .categoryProducts?.last
        else { return }
        if currentProduct.id == lastProduct.id {
            lastItemID = lastProduct.id
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                cViewModel.loadMore(filter: filterString)
            }
        }
    }
    func filter() {
            // Ensure subFilterIndex is valid
            let subFilter = (SubFiltersArray.indices.contains(subFilterIndex)) ? SubFiltersArray[subFilterIndex] : ""

            // Remove "All" from filter type
            if filterType == "All" {
                filterType = ""
            }

            // Construct the filter string
            let components = [filterType, subFilter, sliderAsPrice].filter { !$0.isEmpty }
            filterString = components.joined(separator: " | ")
            
            print("Filter String: \(filterString)")

            // Call API
            let firstItems = filterString.isEmpty ? 10 : 50
            self.cViewModel.fetchCategoriesWithFilter(first: GraphQLNullable<Int>(integerLiteral: 10), after: nil, filter: filterString)

    }
}

#Preview {
    //    ProductsSubView(
    //        filteredProducts: [Product](),
    //        loadMore: {
    //            print("loading more.......!")
    //        })
}
