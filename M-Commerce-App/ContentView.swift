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
        }.onAppear {
            FavoritesManager.shared.setContext(modelContext) // Now modelContext is available
        }
    }
}

#Preview {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Product.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    ContentView()
        .modelContainer(sharedModelContainer)
}
