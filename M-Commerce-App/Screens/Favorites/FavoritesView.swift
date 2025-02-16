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

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),  // First column
        GridItem(.flexible(), spacing: 16),  // Second column
    ]

    var body: some View {

        VStack {
            if products.isEmpty {
                ContentUnavailableView(
                    "There is no favorites", systemImage: "heart.slash",
                    description: Text("discovery new products and add them to your favorites"))
            } else {
                ScrollView {
                    CustomSearchBarView(
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
        .navigationTitle("My favorites")

    }
}

#Preview {
    FavoritesView()
}
