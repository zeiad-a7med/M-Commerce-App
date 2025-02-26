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

    init(
        first: GraphQLNullable<Int>, after: GraphQLNullable<String>,
        filter: String
    ) {
        fetchCategories(
            first: first, after: after,
            query: GraphQLNullable<String>.some(filter))
    }

    func fetchCategories(
        first: GraphQLNullable<Int>, after: GraphQLNullable<String>,
        query: GraphQLNullable<String>
    ) {
        self.isLoading = true
        CategoriesService.getProductsFromApi(first: first, after: after, query: query, complitionHandler: { (result) in
            guard let result = result else { return }
            DispatchQueue.main.async {
                self.categories.categoryProducts = [Product]()
                self.categories.pageInfo = result.pageInfo
                result.categoryProducts?.forEach { prod in
                    self.categories.categoryProducts?.append(prod)
                }
                self.isLoading = false
            }
        })
    }
    func fetchCategoriesWithFilter(
        first: GraphQLNullable<Int>, after: GraphQLNullable<String>,
        filter: String
    ) {
        fetchCategories(
            first: first, after: after,
            query: GraphQLNullable<String>.some(filter))
    }
    func loadMore(filter: String) {
        if !(categories.pageInfo?.hasNextPage ?? true) {
            return
        }
        isLoading = false
        CategoriesService.getProductsFromApi(first: 10, after: categories.pageInfo?.endCursor ?? nil, query: GraphQLNullable<String>.some(filter), complitionHandler: { (result) in
            guard let result = result else {
                return }
            DispatchQueue.main.async {
                self.categories.pageInfo = result.pageInfo
                result.categoryProducts?.forEach { prod in
                    self.categories.categoryProducts?.append(prod)
                }
            }
        })
    }
}
