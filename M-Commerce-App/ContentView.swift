//
//  ContentView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//

import SwiftUI
import SwiftData
import Lottie

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(NetworkMonitor.self) private var newtworkMonitor
    var body: some View {
        TabView {
            if newtworkMonitor.isConnected {
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
                MyOrdersView()
                    .tabItem {
                        Label("Orders", systemImage: "car")
                    }
            }else{
                LottieView(animation: .named("noConnectionAnimation"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
            }
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
        .modelContainer(for: [Product.self,ApplicationUser.self,CurrencyRate.self], inMemory: true)
    }
}
