//
//  FavoritesView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//

import SwiftData
import SwiftUI

struct FavoritesView: View {
    @Query private var products: [Product]
    @State private var isLoggedIn: Bool = false

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),  // First column
        GridItem(.flexible(), spacing: 16),  // Second column
    ]

    var body: some View {
        VStack {
            if isLoggedIn {
                VStack {
                    if products.isEmpty {
                        ContentUnavailableView(
                            "There is no favorites", systemImage: "heart.slash",
                            description: Text(
                                "discovery new products and add them to your favorites"
                            ))
                    } else {
                        ScrollView {
                            CustomTextField(
                                placeholder: "search in favorites.....",
                                onChange: { text in

                                },
                                prefix: {
                                    Image(systemName: "magnifyingglass")
                                },
                                initialText: .constant("")
                            )
                            .padding()

                            // Use LazyVGrid for grid layout
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(products) { product in
                                    ProductCardView(product: product)
                                }
                            }
                            .padding(.horizontal)

                        }
                    }

                }
            } else {
                RequireLoginView()
            }
        }
        .onAppear {
            isLoggedIn = AuthManager.shared.isLoggedIn()
        }

        .navigationTitle("My favorites")
        .toolbar(.hidden,for: .tabBar)
    }
}

#Preview {
    FavoritesView()
}
