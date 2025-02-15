//
//  FloatingButtonView.swift
//  M-Commerce-App
//
//  Created by Usef on 15/02/2025.
//

import SwiftUI

struct FloatingButtonView: View {
    var color: Color
    var inconName: String
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 60, height: 60)
                .shadow(radius: 8)
                .padding(12)
            Image(systemName: inconName)
                .font(.system(size: 30))
                .foregroundStyle(.white)
        }
    }
}
#Preview {
    FloatingButtonView(color: .red, inconName: "plus")
}
