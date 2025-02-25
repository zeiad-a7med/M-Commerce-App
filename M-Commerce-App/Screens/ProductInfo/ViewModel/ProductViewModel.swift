//
//  WeatherViewModel.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation
import SwiftData
import SwiftUI

class VariantForCart {
    var variantId: String
    var lineId: String?
    var title: String
    var quantity: Int
    var totalQuantity: Int
    var price: Double

    init(
        variantId: String, lineId: String? = nil, title: String, quantity: Int,
        totalQuantity: Int,
        price: Double
    ) {
        self.variantId = variantId
        self.lineId = lineId
        self.title = title
        self.quantity = quantity
        self.totalQuantity = totalQuantity
        self.price = price
    }
}
class ProductViewModel: ObservableObject {
    let productId: String
    @Published var productRes: ProductResponse?
    @Published var isLoading: Bool = true
    @Published var hasNewUpdates: Bool = false
    @Published var productAddedToCart: Bool = false
    @Published var deletionAlertVisible: Bool = false
    @Published var currentdeletionVariant: ProductVariant? = nil
    @Published var variantsForCart: [VariantForCart] = []
    init(productId: String) {
        self.productId = productId
        getProductData(productId: productId)
    }
    func getProductData(productId: String) {
        isLoading = true
        ProductService.getProductFromApi(productId: productId) { (result) in
            guard let result = result else { return }
            DispatchQueue.main.async {
                result.product?.variants?.forEach { variant in
                    //                    let quantity: Int = self.getVariantQuantityFromCart(
                    //                        variant: variant)
                    //                    let lineId : String? = self.getLineIdFromCart(variant: variant)
                    self.variantsForCart.append(
                        VariantForCart(
                            variantId: variant.id ?? "",
                            //                            lineId: lineId,
                            title: variant.title ?? "",
                            //                            quantity: quantity,
                            quantity: 0,
                            totalQuantity: variant.quantityAvailable ?? 0,
                            price: Double(variant.price?.amount ?? "0") ?? 0
                        )
                    )
                }
                self.productRes = result
                self.isLoading = false
            }

        }
    }
    func getVariantQuantityFromCart(variant: ProductVariant) -> Int {
        var quantity: Int = 0
        AuthManager.shared.applicationUser?.cart?.lines?.forEach { line in
            if line.variant?.id == variant.id {
                //                self.productAddedToCart = true
                quantity = line.quantity ?? 0
            }
        }
        return quantity
    }

    func getLineIdFromCart(variant: ProductVariant) -> String? {
        var lineId: String?
        AuthManager.shared.applicationUser?.cart?.lines?.forEach { line in
            if line.variant?.id == variant.id {
                //                self.productAddedToCart = true
                lineId = line.id
            }
        }
        return lineId
    }
    func getVariantFromCart(variant: ProductVariant) -> ProductVariant? {
        var cartVariant: ProductVariant?
        AuthManager.shared.applicationUser?.cart?.lines?.forEach { line in
            if line.variant?.id == variant.id {
                cartVariant = line.variant
            }
        }
        return cartVariant
    }

    func updateQuantity(
        variant: ProductVariant, quantity: Int
    ) {
        hasNewUpdates = getLineIdFromCart(variant: variant) != nil
        var temp: [VariantForCart] = []
        variantsForCart.forEach { variantInCart in
            if variantInCart.variantId == variant.id {
                variantInCart.quantity = quantity
//                if quantity == 0 && getLineIdFromCart(variant: variant) != nil {
//                    deletionAlertVisible = true
//                    currentdeletionVariant = variant
//                }

            }
            temp.append(variantInCart)
        }
        variantsForCart = temp
    }

    func addToCart() {
        isLoading = true
        var canAdd = true
        var cartLinesInput: [CartLineInputValue] = []
        variantsForCart.forEach { variant in
            if variant.quantity > 0 {
                let addedQuantity : Int = variant.quantity
                
                let quantityFromCart: Int = self.getVariantQuantityFromCart(
                    variant: ProductVariant(id:variant.variantId))
                
                let variantFromCart = self.getVariantFromCart(variant: ProductVariant(id:variant.variantId))
                
                let allowedLimit = PurchaseRule.ProductPurchaseLimit(productQuantity: variantFromCart?.quantityAvailable ?? 0)
                
                if(variantFromCart != nil){
                    var onlyQuantity: Int = allowedLimit - (variantFromCart?.quantityAvailable ?? 0)
                    
                    onlyQuantity = PurchaseRule.ProductPurchaseLimit(productQuantity: variantFromCart?.quantityAvailable ?? 0) - quantityFromCart
                    
                    if(quantityFromCart == allowedLimit){
                        SnackbarManager.shared.show(message: "you have already added \(quantityFromCart) from \(variantFromCart?.title ?? "") to your cart , you can't add more from this variant.")
                        canAdd = false
                        isLoading = false
                        return
                    }
                    else if((quantityFromCart + variant.quantity) > allowedLimit){
                        SnackbarManager.shared.show(message: "you have already added \(quantityFromCart) from \(variantFromCart?.title ?? "") to your cart , you can only add \(onlyQuantity) more.")
                        canAdd = false
                        isLoading = false
                        return
                    }
                }
               

                cartLinesInput.append(
                    CartLineInputValue(
                        merchandiseId: variant.variantId,
                        quantity: addedQuantity
                    )
                )
            }
        }
        if(canAdd){
            CartService.cartLinesAdd(lines: cartLinesInput) { result in
                self.isLoading = false
                if result?.success == true {
                    SnackbarManager.shared.show(message: "Product added to cart 🛒")
                } else {
                    SnackbarManager.shared.show(message: "Some thing went wrong!")
                }
            }
        }
    }

    func deleteFromCart() {
        isLoading = true
        guard let lineId = getLineIdFromCart(variant: currentdeletionVariant!)
        else {
            self.isLoading = false
            SnackbarManager.shared.show(message: "Some thing went wrong!")
            updateQuantity(variant: currentdeletionVariant!, quantity: 1)
            return
        }

        CartService.cartLinesRemove(lineIds: [lineId]) { result in
            self.isLoading = false
            if result?.success == true {
                SnackbarManager.shared.show(
                    message: "Product removed from your cart 🛒")
            } else {
                SnackbarManager.shared.show(message: "Some thing went wrong!")
            }
        }
    }

    func updateCart(finishingUpdates: @escaping (Bool) -> Void) {
        //        self.isLoading = true
        if hasNewUpdates {
            var cartLinesInput: [CartLineInputValue] = []
            variantsForCart.forEach { variant in
                if variant.quantity > 0 {
                    cartLinesInput.append(
                        CartLineInputValue(
                            id: variant.lineId,
                            merchandiseId: variant.variantId,
                            quantity: variant.quantity
                        )
                    )
                }
            }
            CartService.cartLinesUpdate(lines: cartLinesInput) { result in
                if result?.success == true {
                    //                    self.isLoading = false
                    SnackbarManager.shared.show(
                        message: "Cart updated successfully! 🛒")
                    finishingUpdates(true)

                } else {
                    //                    self.isLoading = false
                    SnackbarManager.shared.show(
                        message: "Some thing went wrong while updating cart!")
                    finishingUpdates(false)
                }
            }
        } else {
            finishingUpdates(true)
        }

    }
}
