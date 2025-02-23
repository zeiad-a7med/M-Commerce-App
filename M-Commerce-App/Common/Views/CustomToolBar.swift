//
//  CustomToolBar.swift
//  M-Commerce-App
//
//  Created by Zeiad on 23/02/2025.
//

import SwiftUI
struct CustomToolBar: View {
    var body: some View {
        HStack {
            ButtonView(
                imageSystemName: ThemeManager.cartImg,
                itemCounter: AuthManager.shared
                    .applicationUser?.cart?
                    .totalQuantity ?? 0)
            .onTapGesture {
                NavigationManager.shared.push(.cart)
            }
            ButtonView(
                imageSystemName: ThemeManager
                    .favouriteImg,
                itemCounter: FavoritesManager.shared.favorites.count)
            .onTapGesture {
                NavigationManager.shared.push(.favorites)
            }
            .onAppear {
                //                                        favoriteCount =
                //                                            FavoritesManager.shared.favorites.count
            }
        }
    }
}

#Preview {
    CustomToolBar()
}
