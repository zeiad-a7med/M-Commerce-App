//
//  CategorieView.swift
//  M-Commerce-App
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI

struct CategorieView: View {
    @State var isSelectedPopup: Bool = false
    @State var filterType: String = ""
    @State var subFilterIndex: Int = 3
    @State var filterString: String = ""
    @State var favoriteCount : Int = 0
    @State var isSubFilterSelected: Bool = false
//    @State var currentFilter:String = ""
    var SubFiltersArray:[String] = ["ACCESSORIES","T-SHIRTS","SHOES",""]
    @StateObject var cViewModel: CategoriesViewModel = CategoriesViewModel(
        first: 10, after: nil, filter: "")
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack {
                        CustomTextField(
                            placeholder: "search for a product...",
                            onChange: { text in
                                print(text)
                            },
                            initialText: .constant("")
                        ).padding(10)
                        FilterBar(filterItems: ["All","Men","Women","Kid"], willFilter: { filterRes in
                            filterType = filterRes
                            print(filterRes)
                            filter()
                        })
                        if !cViewModel.isLoading {
                            if let filteredProd = cViewModel.categories
                                .categoryProducts
                            {
                                ProductsSubView(filteredProducts: filteredProd, loadMore: {
                                    cViewModel.loadMore(filter: filterString)
                                })
                            }
                        }else {
                            VStack {
                                Spacer()
                                ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .scaleEffect(4)
                                Spacer()
                            }.padding(120)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }

                }
                HStack {
                    Spacer()
                    FloatingFilter(SubFiltersArray: SubFiltersArray, filter: { filterRes in
                        subFilterIndex = filterRes
                        filter()
                    }, isSelectedPopup: isSubFilterSelected
                        , filterBtnToggle: {
                        isSubFilterSelected.toggle()
                    })
                }
            }.overlay(content: {
                if cViewModel.categories.categoryProducts?.count ?? 0 == 0 && !cViewModel.isLoading {
                    let msg = "No Products Found"
                    let desc = Text("No  Products Found of type \"\(SubFiltersArray[subFilterIndex] == "" ? "" : "\(SubFiltersArray[subFilterIndex])")\" in \"\(filterType) category\", try using other filters")
                    let img = "square.3.layers.3d.slash"
                    ContentUnavailableView(msg , systemImage: img, description: desc)
                        }
                    })
            .navigationTitle("Categories")
            .toolbar {  //start of: toolbar
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: {
                        LazyHStack {
                            NavigationLink(
                                destination: ShoppingView(),
                                label: {
                                    ButtonView(
                                        imageSystemName: ThemeManager.cartImg,
                                        itemCounter: 10)
                                })
                            NavigationLink(
                                destination: FavoritesView(),
                                label: {
                                    ButtonView(
                                        imageSystemName: ThemeManager
                                            .favouriteImg,
                                        itemCounter: favoriteCount)
                                })
                            .onAppear {
                                favoriteCount = FavoritesManager.shared.favorites.count
                            }
                        }
                    })
            }  //End of: toolbar
        }
    }
    func filter() {
        if filterType == "All" {
            filterType = ""
        }
        if filterType != "" && SubFiltersArray[subFilterIndex] != "" {
            filterString = "\(filterType) | \(SubFiltersArray[subFilterIndex])"
            print("1-\(filterString)")
            self.cViewModel.fetchCategoriesWithFilter(
                first: 10, after: nil, filter: filterString)
        } else if filterType == "" && SubFiltersArray[subFilterIndex] != "" {
            filterString = "\(SubFiltersArray[subFilterIndex])"
            print("2-\(filterString)")
            self.cViewModel.fetchCategoriesWithFilter(
                first: 10, after: nil, filter: filterString)
        } else if filterType != "" && SubFiltersArray[subFilterIndex] == "" {
            filterString = "\(filterType)"
            print("3-\(filterString)")
            self.cViewModel.fetchCategoriesWithFilter(
                first: 10, after: nil, filter: filterString)
        } else if filterType == "" && SubFiltersArray[subFilterIndex] == "" {
            filterString = ""
            print("4-\(filterString)")
            self.cViewModel.fetchCategoriesWithFilter(
                first: 10, after: nil, filter: filterString)
        } else {
            print("else")
            self.cViewModel.fetchCategoriesWithFilter(
                first: 10, after: nil, filter: filterString)
        }
    }
}

#Preview {
    CategorieView()
}
