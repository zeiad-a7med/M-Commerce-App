//
//  WeatherService.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation
import ShopifyAPIKit

protocol ProductServiceProtocol {
    static func getProductFromApi(
        productId: String,
        complitionHandler: @escaping (ProductResponse?) -> Void)
}

class ProductService: ProductServiceProtocol {
    static func getProductFromApi(
        productId: String,
        complitionHandler: @escaping (ProductResponse?) -> Void
    ) {
        ApolloNetwokService.shared.apollo.fetch(
            query: GetProductQuery(id: productId)
        ) { result in
            switch result {
            case .success(let graphQLResult):
                let productDTO = graphQLResult.data?.product
                guard let productDTO else {
                    complitionHandler(
                        ProductResponse(
                            success: false
                        ))
                    return
                }
                let product = GetProductQuery.parse(from: productDTO)
                complitionHandler(
                    ProductResponse(
                        product: product,
                        success: true
                    ))
            case .failure(let error):
                complitionHandler(
                    ProductResponse(
                        success: false
                    ))
                print("Failure! Error: \(error.localizedDescription)")
            }
        }
    }
}
