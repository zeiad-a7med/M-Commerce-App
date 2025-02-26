//
//  CustomButtonWithColorAndBorder.swift
//  M-Commerce-App
//
//  Created by Usef on 19/02/2025.
//

import SwiftUI

struct CustomButtonWith: View {
    var width: CGFloat
    var color: Color
    var borderColor: Color
    var text: String
    var textColor: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(color)
            RoundedRectangle(cornerRadius: 25)
                .stroke(borderColor, lineWidth: 0.5)
            Text(text)
                .font(.system(size: 13).bold())
                .foregroundStyle(textColor)
        }.frame(width: width, height: 45)
            .shadow(radius: 0.5)
    }
}

#Preview {
    NavigationView {
        CustomButtonWith(
            width: 180, color: .red, borderColor: .red, text: "Details",
            textColor: .white
        )
    }
}
