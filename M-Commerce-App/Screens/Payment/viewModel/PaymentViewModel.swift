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
    @Published var paymentHandler = PaymentHandler()
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
    func checkPayments(){
        let result = PaymentHandler.applePayStatus()
        if result.canMakePayments {
            payPressed()
        } else if result.canSetupCards {
            setupPressed()
        }
    }
    func payPressed() {
        paymentHandler.startPayment { success in
            if success {
                // Handle successful payment
                print("Payment successful")
            }else {
                print("Payment Failed")
            }
        }
    }

     func setupPressed() {
        let passLibrary = PKPassLibrary()
        passLibrary.openPaymentSetup()
    }
    
    
}
