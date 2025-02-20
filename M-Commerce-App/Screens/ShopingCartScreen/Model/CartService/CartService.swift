//
//  WeatherService.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation
import ShopifyAPIKit

protocol CartServiceProtocol {
    static func getCartFromApi(
        cartId: String,
        complitionHandler: @escaping (CartResponse?) -> Void)
}

class CartService: CartServiceProtocol {
    static func getCartFromApi(
        cartId: String,
        complitionHandler: @escaping (CartResponse?) -> Void
    ) {
        ApolloNetwokService.shared.apollo.fetch(
            query: GetCartQuery(cartId: cartId)
        ) { result in
            switch result {
            case .success(let graphQLResult):
                let cartDTO = graphQLResult.data?.cart
                guard let cartDTO else {
                    complitionHandler(
                        CartResponse(
                            success: false,
                            message: graphQLResult.errors?.first?.message ?? "No data"
                        ))
                    return
                }
                let cart = GetCartQuery.parse(from: cartDTO)
                complitionHandler(
                    CartResponse(
                        cart: cart,
                        success: true
                    ))
            case .failure(let error):
                complitionHandler(
                    CartResponse(
                        success: false,
                        message: error.localizedDescription
                    ))
            }
        }
    }
}
