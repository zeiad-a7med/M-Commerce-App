//
//  ProductsViewModel.swift
//  M-Commerce-App
//
//  Created by Usef on 14/02/2025.
//

import Foundation
import ShopifyAPIKit

final class ProductsViewModel : ObservableObject {
    @Published var products: BrandResponse = BrandResponse()
    @Published var isLoading: Bool = false
    
    init (first: GraphQLNullable<Int>, after: GraphQLNullable<String> ,filter: String) {
        fetchProducts(first: first, after: after ,query: filter)
    }
    
    func fetchProducts(first: GraphQLNullable<Int>, after: GraphQLNullable<String>, query: String) {
        isLoading = true
        ApolloNetwokService.shared.apollo.fetch(query: GetFilteredProductsQuery(first: first, after: nil, query: GraphQLNullable<String>.some(query))) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.products {
                    self.products = GetFilteredProductsQuery.parseFilteredProducts(from: data)
                }
            case .failure(let error):
                print(error)
            }
        }
        self.isLoading = false
    }
    
    
}
