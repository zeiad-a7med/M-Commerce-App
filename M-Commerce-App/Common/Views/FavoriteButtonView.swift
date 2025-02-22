//
//  FavoriteButtonView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 12/02/2025.
//

import SwiftData
import SwiftUI

struct FavoriteButtonView: View {
    var product: Product
    @Query private var products: [Product]
    @State var alertContent: AlertContent?
    @ObservedObject private var favoritesManager = FavoritesManager.shared  // Singleton instance
    var onFavorite: ((Bool) -> Void)?
    let size: Double
    @State var isFavorite: Bool = false
    @State var isLoggedIn: Bool = false
    var body: some View {
        Button(action: {
            if isFavorite {
                removeFromFavoriteAlert()
            } else {
                if isLoggedIn {
                    addToFavorite()
                    isFavorite = true
                    SnackbarManager.shared.show(message: "Saved to favorites❤️!")
                } else {
                    AlertManager.shared.showLoginAlert()
                }
            }
        }) {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundStyle(.red)
                .font(.system(size: size))
                .frame(alignment: .bottomLeading)
                .background {
                    Circle()
                        .frame(width: size + 20, height: size + 20)
                        .foregroundStyle(.gray.opacity(0.3))
                }
        }
        .onAppear {
            isFavorite = FavoritesManager.shared.isFavorite(product)
            isLoggedIn = AuthManager.shared.isLoggedIn()
        }
        .alert(
            alertContent?.title ?? "",
            isPresented: Binding(
                get: { alertContent?.isVisible ?? false },
                set: { alertContent?.isVisible = $0 }
            )
        ) {
            
                if isFavorite {

                    Button("Remove", role: .destructive) {
                        removeFromFavorite()
                    }
                } else {
                    Button("Save") {
                        addToFavorite()
                    }
                    Button("Cancel") {}
                }
            

        } message: {
            Text(alertContent?.message ?? "")
        }
    }

    func removeFromFavoriteAlert() {
        alertContent = AlertContent(
            title: "are you want to remove this product from your favorites?",
            message: "this product will be removed from your favorites",
            isVisible: true
        )
    }
    func addToFavorite() {
        FavoritesManager.shared.addToFavorites(product)
        isFavorite = true
    }
    func removeFromFavorite() {
        FavoritesManager.shared.removeFromFavorites(product)
        isFavorite = false
    }
}

#Preview {
    //    FavoriteButtonView(size:30)
    //        .preferredColorScheme(.dark)
}
