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
    @State var cE = CurrencyManager.currentCurrencyRate.value
//    @State var currentFilter:String = ""
    var SubFiltersArray:[String] = ["ACCESSORIES","T-SHIRTS","SHOES",""]
    
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
                        })
                        ProductsSubView(
                            filterString: $filterString,
                            SubFiltersArray: SubFiltersArray,
                            subFilterIndex: $subFilterIndex,
                            filterType: $filterType
                        )
                    }

                }
                HStack {
                    Spacer()
                    FloatingFilter(SubFiltersArray: SubFiltersArray, filter: { filterRes in
                        subFilterIndex = filterRes
                    }, isSelectedPopup: isSubFilterSelected
                        , filterBtnToggle: {
                        isSubFilterSelected.toggle()
                    })
                }
            }
            .onAppear {
                cE = CurrencyManager.currentCurrencyRate.value
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
                                        itemCounter: AuthManager.shared.applicationUser?.cart?.totalQuantity ?? 0)
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
    
}

#Preview {
    CategorieView()
}
