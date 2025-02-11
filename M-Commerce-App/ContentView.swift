//
//  ContentView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
                .badge(10)
        }
    }
}

#Preview {
    ContentView()
}
