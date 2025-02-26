//
//  ShoppingCartModel.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 13/02/2025.
//

import Foundation

class ShoppingCartViewModel: ObservableObject {
    @Published var cartResult: CartResponse?
    @Published var isLoading: Bool = false
    @Published var linesToUpdate: [Line] = []
    func getCartData(finishingUpdates: @escaping (Bool) -> Void) {
        isLoading = true
        let cart = AuthManager.shared.applicationUser?.cart
        CartService.getCart { result in
            
            guard let result = result else { return }
            if self.cartResult?.success == false {
                SnackbarManager.shared.show(
                    message: self.cartResult?.message ?? "Something went wrong")
            }else{
                self.cartResult = result
            }
            finishingUpdates(true)
            self.isLoading = false
        }
    }

    func updateLineQuantity(
        line: Line, quantity: Int
    ) {
        var updatedLines: [Line] = []
        cartResult?.cart?.lines?.forEach({ oldLine in
            if oldLine.id == line.id {
                oldLine.quantity = quantity
                let amountPerQuantity: Double =
                    (Double(
                        oldLine.lineCost?.amountPerQuantity?.amount ?? "0.0")
                        ?? 0)
                let currencyCode: String =
                    oldLine.lineCost?.totalAmount?.currencyCode ?? ""
                oldLine.lineCost?.totalAmount = Price(
                    amount: String(Double(quantity) * amountPerQuantity),
                    currencyCode: currencyCode
                )
                oldLine.lineCost?.subtotalAmount = Price(
                    amount: String(Double(quantity) * amountPerQuantity),
                    currencyCode: currencyCode
                )
                if let index = linesToUpdate.firstIndex(where: {
                    $0.id == oldLine.id
                }) {
                    linesToUpdate[index] = oldLine
                } else {
                    linesToUpdate.append(oldLine)
                }
            }
            updatedLines.append(oldLine)
        })
        cartResult?.cart?.lines = updatedLines
    }

    func deleteFromCart(deletedLine: Line) {
        if let index = linesToUpdate.firstIndex(where: {
            $0.id == deletedLine.id
        }) {
            linesToUpdate.remove(at: index)
        }
        
        CartService.cartLinesRemove(lineIds: [deletedLine.id ?? ""]) { result in
            if result?.success == true {
                SnackbarManager.shared.show(
                    message: "Product removed from your cart 🛒")
                var updatedLines: [Line] = []
                self.cartResult?.cart?.lines?.forEach({ line in
                    if line.variant?.id != deletedLine.variant?.id {
                        updatedLines.append(line)
                    }
                })
                self.cartResult?.cart?.lines = updatedLines
            } else {
                SnackbarManager.shared.show(message: "Some thing went wrong!")
            }
        }
    }

    func updateCart(finishingUpdates: @escaping (Bool) -> Void) {
        var cartLinesInput: [CartLineInputValue] = []
        linesToUpdate.forEach { line in
            cartLinesInput.append(
                CartLineInputValue(
                    id: line.id,
                    merchandiseId: line.variant?.id,
                    quantity: line.quantity
                )
            )
        }
        CartService.cartLinesUpdate(lines: cartLinesInput) { result in
            if result?.success == true {
                self.cartResult?.cart = result?.cart
                self.linesToUpdate = []
                finishingUpdates(true)
            } else {
                SnackbarManager.shared.show(
                    message: "Some thing went wrong while updating cart!")
                finishingUpdates(false)
            }
        }

    }
}
