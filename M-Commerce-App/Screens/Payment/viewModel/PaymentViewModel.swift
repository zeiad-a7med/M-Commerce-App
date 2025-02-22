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
    func emptyCart(){
        var tempLineIdList = [String]()
        AuthManager.shared.applicationUser?.cart?.lines?.forEach({ Line in
            tempLineIdList.append(Line.id ?? " ")
        })
        isLoading = true
        CartService.cartLinesRemove(lineIds: tempLineIdList) { result in
            self.isLoading = false
            self.cartResult = result
            let user = AuthManager.shared.applicationUser!
            user.cart = nil
            AuthManager.shared.updateUser(updatedUser: user)
        }
    }
    func createOrder(){
        PaymentService.createOrder{ result in
            print("success \(result?.success)" )
            print ("message\(result?.message)")
            OrderCreateResponse(success: result?.success,message: result?.message)
        }
    }
    
    
}
