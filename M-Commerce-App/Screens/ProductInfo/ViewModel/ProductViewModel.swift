//
//  WeatherViewModel.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var product: ProductResponse?
    @Published var isLoading: Bool = true
    init() {
        getProductData()
    }
    func getProductData() {
        isLoading = true
        ProductService.getProductFromApi{ (result) in
            guard let result = result else { return }
            DispatchQueue.main.async {
                self.isLoading = false
//                self.data = result
//                self.isDay = self.data?.current?.is_day == 1
            }
        }
    }
}
