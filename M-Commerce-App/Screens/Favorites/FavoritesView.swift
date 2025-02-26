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
    @State var searchText: String = ""
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter {
                $0.title.localizedStandardContains(searchText)
            }
        }
    }
    @State private var isLoggedIn: Bool = false

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),  // First column
        GridItem(.flexible(), spacing: 16),  // Second column
    ]

    var body: some View {
        VStack {
            if isLoggedIn {
                VStack {
                    if(!products.isEmpty){
                        CustomTextField(
                            placeholder: "search in favorites.....",
                            onChange: { text in
                                searchText = text
                            },
                            prefix: {
                                Image(systemName: "magnifyingglass")
                            },
                            initialText: .constant("")
                        )
                        .padding()
                    }
                    if filteredProducts.isEmpty {
                        ContentUnavailableView(
                            "There is no favorites", systemImage: "heart.slash",
                            description: Text(
                                "discovery new products and add them to your favorites"
                            ))
                    } else {
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(filteredProducts) { product in
                                    ProductCardView(product: product)
                                }
                            }
                            .padding()

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
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    FavoritesView()
}
