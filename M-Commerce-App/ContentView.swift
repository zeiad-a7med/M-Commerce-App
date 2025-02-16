//
//  ContentView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            CategorieView()
                .tabItem {
                    Label("Categories", systemImage: "square.stack.3d.up.fill")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "person.fill")
                }
        }
        .onAppear {
            FavoritesManager.shared.setContext(modelContext) // Now modelContext is available
        }
    }
}

#Preview {
    ZStack {
        ContentView()
        SnackbarView()
            .environmentObject(SnackbarManager.shared)
    }
    .modelContainer(for: [Product.self,ApplicationUser.self], inMemory: true)
}
