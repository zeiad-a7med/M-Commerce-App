//
//  FavoritesManager.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import Foundation
import SwiftData

class FavoritesManager: ObservableObject {
    static let shared = FavoritesManager()  // Singleton instance

    @Published var favorites: [Product] = []
    private var modelContext: ModelContext?

    private init() {}  // Private initializer to enforce singleton pattern

    /// Set the modelContext from outside (since we can't inject `@Environment` in a singleton)
    func setContext(_ context: ModelContext) {
        self.modelContext = context
        refreshFavorites() // Load favorites when context is set
    }

    /// Fetch all favorite products
    func refreshFavorites() {
        guard let modelContext = modelContext else { return }
        do {
            let request = FetchDescriptor<Product>()
            let allFavorites = try modelContext.fetch(request)
            DispatchQueue.main.async {
                self.favorites = allFavorites
            }
        } catch {
            print("Error fetching favorites: \(error)")
        }
    }

    /// Add product to favorites
    func addToFavorites(_ product: Product) {
        guard let modelContext = modelContext else { return }
        do {
            modelContext.insert(product)
            try modelContext.save()
            refreshFavorites()  // Refresh after adding
        } catch {
            print("Error adding to favorites: \(error)")
        }
    }

    /// Remove product from favorites
    func removeFromFavorites(_ product: Product) {
        guard let modelContext = modelContext else { return }
        do {
            let favorite = favorites.first(where: { $0.id == product.id })!
            modelContext.delete(favorite)
            try modelContext.save()
            favorites.removeAll { $0.id == product.id }
            refreshFavorites()  // Refresh after removing
        } catch {
            print("Error removing from favorites: \(error)")
        }
    }

    /// Check if a product is in favorites
    func isFavorite(_ product: Product) -> Bool {
        return favorites.contains { $0.id == product.id }
    }
    
    func removeAllFavorites() {
        guard let modelContext = modelContext else { return }
        do {
            for favorite in favorites {
                modelContext.delete(favorite)
            }
            try modelContext.save()
            favorites.removeAll()
        } catch {
            print("Error removing all favorites: \(error)")
        }
    }
}
