//
//  FavoriteButtonView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 12/02/2025.
//

import SwiftUI

struct FavoriteButtonView: View {
    var onFavorite : (() -> Void)?
    let size : Double
    @State var isFavorite: Bool = false
    var body: some View {
        Button(action: {
            isFavorite.toggle()
            onFavorite?()
        }) {
            Image(systemName: (isFavorite) ? "heart.fill" : "heart")
                .foregroundStyle(.red)
                .font(.system(size: size))
                .frame(alignment: .bottomLeading)
                .background {
                    Circle()
                        .frame(width: size+20, height: size+20)
                        .foregroundStyle(.gray.opacity(0.3))
                }
        }
    }
}

#Preview {
    FavoriteButtonView(size:30)
        .preferredColorScheme(.dark)
}
