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
                                }
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
                VStack {
                    ContentUnavailableView(
                        "You are not logged in", systemImage: "person.slash",
                        description: Text(
                            "to view your favorites please sign in")
                    ).frame(height: 300)
                    NavigationLink(destination: LoginView()) {
                        CustomRoundedButtonView(
                            text: "Sign In",
                            width: 100,
                            onTap: {},
                            isButtonEnabled: .constant(true)
                        )
                        .allowsHitTesting(false)
                    }
                }
            }
        }
        .onAppear {
            isLoggedIn = AuthManager.shared.isLoggedIn()
        }

        .navigationTitle("My favorites")

    }
}

#Preview {
    FavoritesView()
}
