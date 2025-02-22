//
//  WeatherService.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation
import ShopifyAPIKit

protocol CartServiceProtocol {
    static func getCart(
        complitionHandler: @escaping (CartResponse?) -> Void)
    static func createCart(
        lines : [CartLineInputValue]?,
        complitionHandler: @escaping (CartResponse?) -> Void)
    static func cartLinesAdd(
        lines : [CartLineInputValue],
        complitionHandler: @escaping (CartResponse?) -> Void)
    static func cartLinesUpdate(
        lines : [CartLineInputValue],
        complitionHandler: @escaping (CartResponse?) -> Void)
    static func cartLinesRemove(
        lineIds : [String],
        complitionHandler: @escaping (CartResponse?) -> Void)
}

class CartService: CartServiceProtocol {
    static func getCart(
        complitionHandler: @escaping (CartResponse?) -> Void
    ) {
        if AuthManager.shared.isLoggedIn() {
            guard let cartID = AuthManager.shared.applicationUser?.cart?.id else {
                createCart (lines: nil){ result in
                    complitionHandler(result)
                }
                return
            }
            ApolloNetwokService.shared.apollo.fetch(
                query: GetCartQuery(cartId: cartID),cachePolicy: .fetchIgnoringCacheData
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    let cartDTO = graphQLResult.data?.cart
                    guard let cartDTO else {
                        complitionHandler(
                            CartResponse(
                                success: false,
                                message: graphQLResult.errors?.first?.message
                                    ?? "No data"
                            ))
                        return
                    }
                    let cart = GetCartQuery.parse(from: cartDTO)

                    //update user cart
                    var user = AuthManager.shared.applicationUser!
                    user.cart = cart
                    AuthManager.shared.updateUser(updatedUser: user)
                    
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
    
    static func createCart(
        lines : [CartLineInputValue]?,
        complitionHandler: @escaping (CartResponse?) -> Void
    ) {
        if AuthManager.shared.isLoggedIn() {
            guard let cartID = AuthManager.shared.applicationUser?.cart?.id else {
                let user = AuthManager.shared.applicationUser!
                var linesInput : [ShopifyAPIKit.CartLineInput] = []
                
                lines?.forEach { line in
                    linesInput.append(ShopifyAPIKit.CartLineInput(
                        quantity: GraphQLNullable<Int>.some(line.quantity ?? 0),
                        merchandiseId: line.merchandiseId ?? ""
                    ))
                }
                ApolloNetwokService.shared.apollo.perform(
                    mutation: CreateCartMutation(
                        email: GraphQLNullable<String>.some(user.email!),
                        customerAccessToken: GraphQLNullable<String>.some(user.accessToken!),
                        phone: GraphQLNullable<String>.some(user.phone!),
                        lines: GraphQLNullable<[CartLineInput]>.some(linesInput)
                    )
                ) { result in
                    switch result {
                    case .success(let graphQLResult):
                        let cartDTO = graphQLResult.data?.cartCreate?.cart
                        guard let cartDTO else {
                            complitionHandler(
                                CartResponse(
                                    success: false,
                                    message: graphQLResult.data?.cartCreate?.userErrors.first?.message
                                        ?? "No data"
                                ))
                            return
                        }
                        let cart = CreateCartMutation.parse(from: cartDTO)

                        //update user cart
                        var user = AuthManager.shared.applicationUser!
                        user.cart = cart
                        AuthManager.shared.updateUser(updatedUser: user)
                        
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
                return
            }
            //user allready have cart
            return complitionHandler(nil)
        }
    }
    
    static func cartLinesAdd(lines: [CartLineInputValue], complitionHandler: @escaping (CartResponse?) -> Void) {
        if AuthManager.shared.isLoggedIn() {
            guard let cartID = AuthManager.shared.applicationUser?.cart?.id else {
                createCart (lines: lines){ result in
                    complitionHandler(result)
                }
                return
            }
            
            var linesInput : [ShopifyAPIKit.CartLineInput] = []
            lines.forEach { line in
                linesInput.append(ShopifyAPIKit.CartLineInput(
                    quantity: GraphQLNullable<Int>.some(line.quantity ?? 0),
                    merchandiseId: line.merchandiseId ?? ""
                ))
            }
            
            ApolloNetwokService.shared.apollo.perform(
                mutation: CartLinesAddMutation(
                    cartId: cartID,
                    lines:linesInput
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    let cartDTO = graphQLResult.data?.cartLinesAdd?.cart
                    guard let cartDTO else {
                        complitionHandler(
                            CartResponse(
                                success: false,
                                message: graphQLResult.data?.cartLinesAdd?.userErrors.first?.message
                                    ?? "No data"
                            ))
                        return
                    }
                    
                    let cart = CartLinesAddMutation.parse(from: cartDTO)

                    //update user cart
                    var user = AuthManager.shared.applicationUser!
                    user.cart = cart
                    AuthManager.shared.updateUser(updatedUser: user)
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
    
    static func cartLinesUpdate(lines: [CartLineInputValue], complitionHandler: @escaping (CartResponse?) -> Void) {
        if AuthManager.shared.isLoggedIn() {
            guard let cartID = AuthManager.shared.applicationUser?.cart?.id else {
                complitionHandler(
                    CartResponse(
                        success: false,
                        message: "Some thing went wrong"
                    ))
                return
            }
            
            var linesInput : [ShopifyAPIKit.CartLineUpdateInput] = []
            lines.forEach { line in
                linesInput.append(ShopifyAPIKit.CartLineUpdateInput(
                    id:line.id ?? "",
                    quantity: GraphQLNullable<Int>.some(line.quantity ?? 0),
                    merchandiseId: line.merchandiseId ?? ""
                ))
            }
            
            ApolloNetwokService.shared.apollo.perform(
                mutation: CartLinesUpdateMutation(
                    cartId: cartID,
                    lines:linesInput
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    let cartDTO = graphQLResult.data?.cartLinesUpdate?.cart
                    guard let cartDTO else {
                        complitionHandler(
                            CartResponse(
                                success: false,
                                message: graphQLResult.data?.cartLinesUpdate?.userErrors.first?.message
                                    ?? "No data"
                            ))
                        return
                    }
                    
                    let cart = CartLinesUpdateMutation.parse(from: cartDTO)

                    //update user cart
                    var user = AuthManager.shared.applicationUser!
                    user.cart = cart
                    AuthManager.shared.updateUser(updatedUser: user)
                    
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
    
    static func cartLinesRemove(lineIds: [String], complitionHandler: @escaping (CartResponse?) -> Void) {
        if AuthManager.shared.isLoggedIn() {
            guard let cartID = AuthManager.shared.applicationUser?.cart?.id else {
                complitionHandler(
                    CartResponse(
                        success: false,
                        message: "Some thing went wrong"
                    ))
                return
            }
            
            ApolloNetwokService.shared.apollo.perform(
                mutation: CartLinesRemoveMutation(
                    cartId: cartID,
                    lineIds: lineIds
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    let cartDTO = graphQLResult.data?.cartLinesRemove?.cart
                    guard let cartDTO else {
                        complitionHandler(
                            CartResponse(
                                success: false,
                                message: graphQLResult.data?.cartLinesRemove?.userErrors.first?.message
                                    ?? "No data"
                            ))
                        return
                    }
                    
                    let cart = CartLinesRemoveMutation.parse(from: cartDTO)

                    //update user cart
                    var user = AuthManager.shared.applicationUser!
                    user.cart = cart
                    AuthManager.shared.updateUser(updatedUser: user)
                    
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
}
