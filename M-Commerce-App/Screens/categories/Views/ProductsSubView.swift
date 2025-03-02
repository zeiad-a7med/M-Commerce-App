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
        first: 50, after: nil, filter: "")
    @Binding var filterString: String
    var SubFiltersArray: [String]
    @Binding var subFilterIndex: Int
    @Binding var filterType: String
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var lastItemID: String?
    @State var filteredProducts: [Product] = []
    @Binding var isSearchActive: Bool
    @Binding var searchText: String
    @State var mainFilter:String?
    @Binding var sliderAsPrice:String
    var body: some View {

        Group{
            if NetworkMonitor.shared.isConnected {
                if isSearchActive {
                    CustomSearchView(searchText: $searchText ,
                                     mainFilter: $mainFilter)
                }else {
                    if !cViewModel.isLoading {
                        if cViewModel.categories
                            .categoryProducts?.count ?? 0 > 0
                        {
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach(cViewModel.categories
                                    .categoryProducts ?? [], id: \.id) { product in
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
                            .onChange(of: cViewModel.categories
                                .categoryProducts, { oldValue, newValue in
                                    filteredProducts = cViewModel.categories.categoryProducts ?? []
                                })
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
            else {
                VStack{
                    AnimationView(name: "noConnectionAnimation")
                    Text("Check your internet connection")
                }
            }
        }.refreshable {
            cViewModel.fetchCategories(first: 50, after: nil, query: "")
            }
        .onAppear {
            if !(cViewModel.categories.categoryProducts?.isEmpty ?? false)  {
                cViewModel.fetchCategories(first: 50, after: nil, query: "")
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
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                cViewModel.loadMore(filter: filterString)
//            }
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
            self.cViewModel.fetchCategoriesWithFilter(first: 50, after: nil, filter: filterString)

    }
}

#Preview {
    //    ProductsSubView(
    //        filteredProducts: [Product](),
    //        loadMore: {
    //            print("loading more.......!")
    //        })
}
