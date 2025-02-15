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
    @State var subFilterType: String = ""
    @State var filterString: String = ""
    @State var prevFilterString: String = "ccc"
    @State var favoriteCount : Int = 0
    @StateObject var cViewModel: CategoriesViewModel = CategoriesViewModel(
        first: 10, after: nil, filter: "")
    var body: some View {

        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack {
                        CustomSearchBarView(
                            placeholder: "search for a product...",
                            onChange: { text in
                                print(text)
                            }
                        ).padding(10)

                        FilterBar(willFilter: { filterRes in
                            subFilterType = ""
                            filterType = filterRes
                            print(filterRes)
                            filter()
                        })

                        if let filteredProd = cViewModel.categories
                            .categoryProducts
                        {
                            ProductsSubView(filteredProducts: filteredProd)
                        }

                    }
                }

                HStack {
                    Spacer()
                    ZStack {
                        Button(
                            action: {
                                if self.subFilterType != "ACCESSORIES" {
                                    self.subFilterType = "ACCESSORIES"
                                } else {
                                    self.subFilterType = ""
                                }
                                filter()
                            },
                            label: {
                                FloatingButtonView(
                                    color: .gray, inconName: "hat.cap")
                            }
                        ).offset(y: isSelectedPopup ? -270.0 : 0.0)
                        Button(
                            action: {
                                if self.subFilterType != "T-SHIRTS" {
                                    self.subFilterType = "T-SHIRTS"
                                } else {
                                    self.subFilterType = ""
                                }
                                filter()
                            },
                            label: {
                                FloatingButtonView(
                                    color: .gray, inconName: "tshirt")
                            }
                        ).offset(y: isSelectedPopup ? -180.0 : 0.0)
                        Button(
                            action: {
                                if self.subFilterType != "SHOES" {
                                    self.subFilterType = "SHOES"
                                } else {
                                    self.subFilterType = ""
                                }
                                filter()
                            },
                            label: {
                                FloatingButtonView(
                                    color: .gray, inconName: "shoe")
                            }
                        ).offset(y: isSelectedPopup ? -90.0 : 0.0)

                        Button(
                            action: {
                                withAnimation(
                                    .spring(
                                        response: 0.5, dampingFraction: 0.5,
                                        blendDuration: 0)
                                ) {
                                    isSelectedPopup.toggle()
                                }
                            },
                            label: {
                                FloatingButtonView(
                                    color: ThemeManager.darkPuble,
                                    inconName: "plus")
                            })
                    }
                }
            }
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
        if filterString == prevFilterString { return }
        if filterType == "All" {
            filterType = ""
        }
        if filterType != "" && subFilterType != "" {
            filterString = "\(filterType) | \(subFilterType)"
            print("1-\(filterString)")
            self.cViewModel.fetchCategoriesWithFilter(
                first: 10, after: nil, filter: filterString)
        } else if filterType == "" && subFilterType != "" {
            print("2-\(filterString)")
            filterString = "\(subFilterType)"
            self.cViewModel.fetchCategoriesWithFilter(
                first: 10, after: nil, filter: filterString)
        } else if filterType != "" && subFilterType == "" {
            filterString = "\(filterType)"
            print("3-\(filterString)")
            self.cViewModel.fetchCategoriesWithFilter(
                first: 10, after: nil, filter: filterString)
        } else if filterType == "" && subFilterType == "" {
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

struct FloatingButtonView: View {
    var color: Color
    var inconName: String
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 60, height: 60)
                .shadow(radius: 8)
                .padding(12)
            Image(systemName: inconName)
                .font(.system(size: 30))
                .foregroundStyle(.white)
        }
    }
}
