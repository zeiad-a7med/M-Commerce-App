//
//  CategoriesService.swift
//  M-Commerce-App
//
//  Created by Usef on 26/02/2025.
//

import Foundation
import ShopifyAPIKit

protocol CategoriesServiceProtocol {
    static func getProductsFromApi(first: GraphQLNullable<Int>, after: GraphQLNullable<String>,
                                  query: GraphQLNullable<String>,
                                  complitionHandler: @escaping (CategoriesResponse?) -> Void)
}

class CategoriesService: CategoriesServiceProtocol {
    
    static func getProductsFromApi(first: GraphQLNullable<Int>, after: GraphQLNullable<String>,
                                  query: GraphQLNullable<String>, complitionHandler: @escaping (CategoriesResponse?) -> Void) {
        ApolloNetwokService.shared.apollo.fetch(query: GetFilteredProductsQuery(first: first, after: after, query: query),cachePolicy: .fetchIgnoringCacheData) { result in
            print(1)
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data?.products {
                        var res = GetFilteredProductsQuery.parseFilteredProductsForCat(from: data)
                        complitionHandler(res)
                        print(res.pageInfo?.endCursor ?? "No endCursor")
                        print(res.categoryProducts?.count ?? 0)
                        print(res.message ?? "No message")
                        print(res.success ?? true)
                    }
                case .failure(let error):
                    complitionHandler(
                        CategoriesResponse(success: false, message: error.localizedDescription))
                }
            }
        }
}
