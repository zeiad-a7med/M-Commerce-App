//
//  FavoritesView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//

import SwiftUI
import SwiftData
struct FavoritesView: View {
    @Query private var products: [Product]
    // Define the number of columns for the grid
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),  // First column
        GridItem(.flexible(), spacing: 16),  // Second column
    ]

    var body: some View {
        ScrollView {
            CustomSearchBarView(
                placeholder: "search in favorites.....",
                onChange: { text in
                    print("Search text: \(text)")
                },
                prefix: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                        .font(.title2)
                },
                suffix: {
                    Button(action: {
                        print("Cleared")
                    }) {
                        Image(systemName: "line.3.horizontal.decrease")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                }
            )
            .padding()

            // Use LazyVGrid for grid layout
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(products) { product in
                    NavigationLink {
                        ProductInfoView()
                    } label: {
                        ProductCardView()
                    }
                }

            }
            .padding(.horizontal)
        }
        .navigationTitle("My favorites")

    }
}

#Preview {
    FavoritesView()
        .modelContainer(for: Product.self, inMemory: true)

}
