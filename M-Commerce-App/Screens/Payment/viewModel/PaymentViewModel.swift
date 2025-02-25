//
//  PaymentViewModel.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 20/02/2025.
//

import Foundation
import PassKit

class PaymentViewModel : ObservableObject{
    @Published var cartResult : CartResponse?
    @Published var isLoading : Bool = false
    @Published var PageDismiss : Bool = false
    @Published var orderCreateResult : OrderCreateResponse?
    var couponCode : String?
    func getCartData(){
        isLoading = true
        CartService.getCart{ result in
            guard let result = result else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                self.cartResult = result
                self.couponCode = AuthManager.shared.applicationUser?.cart?.cost?.couponCode ?? ""
            }
        }
    }
    func createOrder(){
        if(cartResult?.cart != nil){
            PaymentService.createOrder(){ result in
                var user = AuthManager.shared.applicationUser
                user?.cart = nil
                user?.couponCode = nil
                AuthManager.shared.updateUser(updatedUser: user!)
                SnackbarManager.shared.show(message: "your order has been placed!")
            }
        }
    }
    
    
}
