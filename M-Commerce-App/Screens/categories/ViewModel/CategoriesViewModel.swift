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
        self.isLoading = true
        ApolloNetwokService.shared.apollo.fetch(query: GetFilteredProductsQuery(first: first, after: after, query: query)){ result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.products {
                    self.categories = GetFilteredProductsQuery.parseFilteredProducts(from: data)
                }
                
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
            }
            self.isLoading = false
        }
    }
    func fetchCategoriesWithFilter(first: GraphQLNullable<Int>, after: GraphQLNullable<String>, filter: String) {
//        categories.categoryProducts?.removeAll()
        fetchCategories(first: first, after: after ,query: GraphQLNullable<String>.some(filter))
    }
    func loadMore(filter: String){
        if !(categories.pageInfo?.hasNextPage ?? true) {
            return
        }
        self.isLoading = true
        ApolloNetwokService.shared.apollo.fetch(query: GetFilteredProductsQuery(first: 10, after: categories.pageInfo?.endCursor ?? "", query: GraphQLNullable<String>.some(filter))){ result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.products {
                    var tempCategories: CategoriesResponse = CategoriesResponse()
                    tempCategories = GetFilteredProductsQuery.parseFilteredProducts(from: data)
                    self.categories.pageInfo = tempCategories.pageInfo
                    tempCategories.categoryProducts?.forEach { (item) in
                        self.categories.categoryProducts?.append(item)
                    }
                }
                print("reloaded = \(self.categories.categoryProducts?.count ?? 0)")
            case .failure(let error):
                print("Failure! Error: \(error.localizedDescription)")
            }
            self.isLoading = false
        }
    }
}
