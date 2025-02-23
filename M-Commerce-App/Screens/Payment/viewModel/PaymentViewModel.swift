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
    func getCartData(){
        isLoading = true
        CartService.getCart{ result in
            guard let result = result else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                self.cartResult = result
            }
        }
    }
    func createOrder(){
        if(cartResult?.cart != nil){
            PaymentService.createOrder(){ result in
                print("success \(String(describing: result?.success))" )
                print ("message\(result?.message ?? "")")
                OrderCreateResponse(success: result?.success,message: result?.message)
            }
        }
    }
    
    
}
