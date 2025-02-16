//
//  CustomRoundedButtonView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 12/02/2025.
//

import SwiftUI

struct CustomRoundedButtonView: View {
    var text: String
    var systemIconName: String?
    var width : CGFloat?
    var onTap: (() -> Void)?
    @Binding var isButtonEnabled : Bool
    var body: some View {
        Button(
            action: {
                onTap?()
            },
            label: {
                HStack {
                    if(systemIconName != nil){
                        Image(systemName: systemIconName!)
                            .foregroundStyle(.white)
                    }
                    

                    Text(text)
                        .foregroundStyle(.white)
                }
            }
        )
        .disabled(!isButtonEnabled)
        .padding(20)
        .padding(.horizontal,width)
        .background(isButtonEnabled ? ThemeManager.darkPuble : ThemeManager.darkPuble.opacity(0.5))
        .cornerRadius(30)
        .animation(.easeInOut(duration: 0.3), value: isButtonEnabled)
    }
}

#Preview {
    CustomRoundedButtonView(
        text:"Add to Cart",
        systemIconName: "handbag",
        width: 100,
        onTap: {
            print("Tapped")
        },
        isButtonEnabled: .constant(true)
    )
}
