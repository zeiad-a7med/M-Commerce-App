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
    @State var favoriteCount: Int = 0
    @State var isSubFilterSelected: Bool = false
    @State var cE = CurrencyManager.currentCurrencyRate.value
    //    @State var currentFilter:String = ""
    var SubFiltersArray: [String] = ["ACCESSORIES", "T-SHIRTS", "SHOES", ""]
    @State var isSearchActive:Bool = false
    @State var searchText:String = ""
    var body: some View {

        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    CustomTextField(
                        placeholder: "search for products ...",
                        onChange: { text in
                            self.searchText = text
                        },
                        prefix: {
                            Image(systemName: "magnifyingglass")
                        },
                        initialText: .constant(""),
                        onActive: { active in
                            if active {
                                isSearchActive = true
                            }else {
                                isSearchActive = false
                            }
                        }
                    ).padding(10)
                    FilterBar(
                        filterItems: ["All", "Men", "Women", "Kid"],
                        willFilter: { filterRes in
                            filterType = filterRes
                            print(filterRes)
                        })
                    ProductsSubView(
                        filterString: $filterString,
                        SubFiltersArray: SubFiltersArray,
                        subFilterIndex: $subFilterIndex,
                        filterType: $filterType, isSearchActive: $isSearchActive
                    )
                }

            }

            HStack {
                Spacer()
                FloatingFilter(
                    SubFiltersArray: SubFiltersArray,
                    filter: { filterRes in
                        subFilterIndex = filterRes
                    }, isSelectedPopup: isSubFilterSelected,
                    filterBtnToggle: {
                        isSubFilterSelected.toggle()
                    })
            }
        }
        .onAppear {
            cE = CurrencyManager.currentCurrencyRate.value
        }
        

    }

}

#Preview {
    CategorieView()
}
