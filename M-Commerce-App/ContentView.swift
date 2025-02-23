//
//  ContentView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//

import Lottie
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(NetworkMonitor.self) private var newtworkMonitor
    @StateObject private var navigationManager = NavigationManager.shared

    var body: some View {
        TabView (selection:$navigationManager.tab){
            NavigationStack(path: $navigationManager.path) {
                HomePageView()
                    .navigationTitle("Home")
                    .toolbar {  //start of: toolbar
                        ToolbarItem(
                            placement: .topBarTrailing,
                            content: {
                                CustomToolBar()
                            })
                    }  //End of: toolbar
                    .navigationDestination(for: RouteTypes.self) { target in
                        NavigationManager.shared.manageDestination(target)
                    }
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }.tag(0)
            NavigationStack(path: $navigationManager.path) {
                CategorieView()
                    .navigationTitle("Categories")
                    .toolbar {  //start of: toolbar
                        ToolbarItem(
                            placement: .topBarTrailing,
                            content: {
                                CustomToolBar()
                            })
                    }
                    .navigationDestination(for: RouteTypes.self) { target in
                        NavigationManager.shared.manageDestination(target)
                    }
            }
            .tabItem {
                Label(
                    "Categories",
                    systemImage: "square.stack.3d.up.fill"
                )
            }.tag(1)
            NavigationStack(path: $navigationManager.path) {
                Settings()
                    .navigationDestination(for: RouteTypes.self) { target in
                        NavigationManager.shared.manageDestination(target)
                    }
            }
            .tabItem {
                Label("Settings", systemImage: "person.fill")
            }.tag(2)
            NavigationStack(path: $navigationManager.path) {
                MyOrdersView()
                    .navigationDestination(for: RouteTypes.self) { target in
                        NavigationManager.shared.manageDestination(target)
                    }
            }
            .tabItem {
                Label("Orders", systemImage: "car")
            }.tag(3)

        }
        .onAppear {
            FavoritesManager.shared.setContext(modelContext)
            AuthManager.shared.setContext(modelContext)
            CurrencyManager.shared.setContext(modelContext)
        }
    }

}

#Preview {
    NavigationView {
        ZStack {
            ContentView()
                .environment(NetworkMonitor())
            SnackbarView()
                .environmentObject(SnackbarManager.shared)
            AlertView()
                .environmentObject(AlertManager.shared)
        }
        .modelContainer(
            for: [Product.self, ApplicationUser.self, CurrencyRate.self],
            inMemory: true)
    }
}
