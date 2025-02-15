//
//  WeatherViewModel.swift
//  WeatherCast
//
//  Created by Zeiad on 11/02/2025.
//

import Foundation
import SwiftData
import SwiftUI
class ProductViewModel: ObservableObject {
    let productId: String
    @Published var productRes: ProductResponse?
    @Published var isLoading: Bool = true
    @Published var alertContent: AlertContent?
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
    func addToFavoriteAlert() {
        alertContent = AlertContent(
            title: "are you want to add this product to favorites",
            message: "this product will be added to your favorites",
            isVisible: true
        )
    }
    func addToFavorite(modelContext: ModelContext) {
        modelContext.insert(productRes!.product!)
        do {
            try modelContext.save()
            print("saved")
        } catch {
            // Show an error if saving fails
            alertContent = AlertContent(
                title: "Error",
                message:
                    "Failed to add product to favorites. Please try again.",
                isVisible: true
            )
        }
    }
}
