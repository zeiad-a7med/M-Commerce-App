//
//  CategoriesViewModel.swift
//  M-Commerce-App
//
//  Created by Usef on 13/02/2025.
//

import Foundation
import ShopifyAPIKit
import SwiftUI

final class CategoriesViewModel: ObservableObject {
    @Published var categories: CategoriesResponse = CategoriesResponse()
    @Published var isLoading: Bool = true
    
    init(first: GraphQLNullable<Int>, after: GraphQLNullable<String> ,filter: String) {
        fetchCategories(first: first, after: after ,query: GraphQLNullable<String>.some(filter))
    }
     
func fetchCategories(first: GraphQLNullable<Int>, after: GraphQLNullable<String>, query: GraphQLNullable<String>) {
        self.categories.categoryProducts = [Product]()
        ApolloNetwokService.shared.apollo.fetch(query: GetFilteredProductsQuery(first: first, after: after, query: query)){ result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.products {
                    self.categories = GetFilteredProductsQuery.parseFilteredProducts(from: data)
                }
                self.isLoading = false
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
    func fetchCategoriesWithFilter(first: GraphQLNullable<Int>, after: GraphQLNullable<String>, filter: String) {
        categories.categoryProducts?.removeAll()
        fetchCategories(first: first, after: after ,query: GraphQLNullable<String>.some(filter))
    }
}
