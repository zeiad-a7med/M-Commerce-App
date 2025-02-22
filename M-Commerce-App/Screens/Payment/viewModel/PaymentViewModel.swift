//
//  PaymentViewModel.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 20/02/2025.
//

import Foundation


class PaymentViewModel : ObservableObject{
    @Published var cartResult : CartResponse?
    @Published var isLoading : Bool = false
    init(){
        getCartData()
    }
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
    
    
}
