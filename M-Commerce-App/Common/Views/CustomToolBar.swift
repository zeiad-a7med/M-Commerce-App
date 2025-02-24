//
//  CustomToolBar.swift
//  M-Commerce-App
//
//  Created by Zeiad on 23/02/2025.
//

import SwiftUI

struct CustomToolBar: View {
    @State var favoriteCount: Int = 0
    @State var cartCount: Int = 0
    @ObservedObject var authManager = AuthManager.shared
    @ObservedObject var favoritesManager = FavoritesManager.shared
    var body: some View {
        HStack {
            ButtonView(
                imageSystemName: ThemeManager.cartImg,
                itemCounter: authManager.applicationUser?.cart?.totalQuantity ?? 0
            )
            .onTapGesture {
                NavigationManager.shared.push(.cart)
            }
            ButtonView(
                imageSystemName: ThemeManager
                    .favouriteImg,
                itemCounter: favoritesManager.favorites.count
            )
            .onTapGesture {
                NavigationManager.shared.push(.favorites)
            }
        }
    }
}

#Preview {
    CustomToolBar()
}
