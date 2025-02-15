//
//  WeatherViewModel.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation

class ProductViewModel: ObservableObject {
    let productId: String
    @Published var productRes: ProductResponse?
    @Published var isLoading: Bool = true
    init(productId: String) {
        self.productId = productId
        getProductData(productId: productId)
    }
    func getProductData(productId: String) {
        isLoading = true
        ProductService.getProductFromApi(productId: productId){ (result) in
            guard let result = result else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                self.productRes = result
            }
        }
    }
    func addToFavorites(){
        
    }
}
