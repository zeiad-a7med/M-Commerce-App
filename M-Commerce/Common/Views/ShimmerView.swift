//
//  ShimmerView.swift
//  M-Commerce
//
//  Created by Zeiad on 09/02/2025.
//

import SwiftUI

struct ShimmerView: View {
    let width: CGFloat
    let height: CGFloat
    @State private var move = false

    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.gray.opacity(0.4), Color.gray.opacity(0.2),
                        Color.gray.opacity(0.4),
                    ]),
                    startPoint: .leading, endPoint: .trailing)
            )
            .frame(width: width, height: height)
            .mask(
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color.white.opacity(0.6))
                    .offset(x: move ? width : -width)
            )
            .onAppear {
                withAnimation(
                    Animation.linear(duration: 1.5).repeatForever(
                        autoreverses: false)
                ) {
                    move.toggle()
                }
            }
    }
}

#Preview {
    ShimmerView(
        width: 150, height: 150
    )
}
