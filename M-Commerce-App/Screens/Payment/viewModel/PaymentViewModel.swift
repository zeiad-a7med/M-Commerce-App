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
        CartService.getCartFromApi(cartId: "gid://shopify/Cart/Z2NwLWV1cm9wZS13ZXN0MTowMUpNRlhFOE5ZUFpWTjc0MTZZWEhWUVpBMQ?key=a64ceb3ee3c33d49e49572c4025d9524") { result in
            guard let result = result else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                self.cartResult = result
            }
        }
    }
  
    
    
}
