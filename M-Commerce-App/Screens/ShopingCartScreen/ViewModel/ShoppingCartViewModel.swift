//
//  ShoppingCartModel.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 13/02/2025.
//

import Foundation


class ShoppingCartViewModel : ObservableObject{
    @Published var cartResult : CartResponse?
    @Published var isLoading : Bool = false
    init(){
        getCartData()
    }
    func getCartData(){
        isLoading = true
        CartService.getCartFromApi(cartId: "gid://shopify/Cart/Z2NwLWV1cm9wZS13ZXN0MTowMUpNRlhFOE5ZUFpWTjc0MTZZWEhWUVpBMQ?key=a64ceb3ee3c33d49e49572c4025d9524") { result in
            guard let result = result else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                self.cartResult = result
            }
        }
    }
    func updateLine(line:Line){
        let tempLines = cartResult?.cart?.lines
        var updatedLines: [Line] = []
        tempLines?.forEach({ oldLine in
            if(oldLine.id == line.id){
                oldLine.quantity = 1
                updatedLines.append(oldLine)
            }else{
                updatedLines.append(oldLine)
            }
        })
        DispatchQueue.main.async {
            self.cartResult?.cart?.lines = updatedLines
//            self.cartResult = CartResponse(
//                cart: Cart(
//                    id: self.cartResult?.cart?.id,
//                    checkoutUrl: self.cartResult?.cart?.checkoutUrl,
//                    note: self.cartResult?.cart?.note,
//                    totalQuantity: self.cartResult?.cart?.totalQuantity,
//                    lines: updatedLines,
//                    cost: self.cartResult?.cart?.cost,
//                    createdAt: self.cartResult?.cart?.createdAt,
//                    updatedAt: self.cartResult?.cart?.updatedAt
//                ),
//                success: self.cartResult?.success,
//                message: self.cartResult?.message
//            )
        }
    }
}
