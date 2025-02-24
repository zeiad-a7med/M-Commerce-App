//
//  SearchViewModel.swift
//  M-Commerce-App
//
//  Created by Usef on 24/02/2025.
//

import Foundation
import ShopifyAPIKit
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var filteredProducts: SearchModel = SearchModel(products: [SearchData]())
    @Published var isLoading: Bool = true
    
    init (filterProduct:String) {
        searchOnProduct(filterProduct: filterProduct)
    }
    
    func searchOnProduct(filterProduct:String) {
        isLoading = true
        ApolloNetwokService.shared.apollo.fetch(query: SearchProductQuery(filter: filterProduct), cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
            case .success(let productsResult):
                if let searchM = productsResult.data?.search {
                    self.filteredProducts = SearchProductQuery.parse(searchResponse: searchM)
                    print( "Search products found: \(self.filteredProducts.products.count)")
                    
                }else {
                    print( "No products found")
                }
            case .failure(let error):
                print("error getting product in SearchViewModel",error.localizedDescription)
            }
            self.isLoading = false
        }
        
    }
}


