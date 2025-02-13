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
        .padding(20)
        .padding(.horizontal,width)
        .background(ThemeManager.darkPuble)
        .cornerRadius(30)
    }
}

#Preview {
    CustomRoundedButtonView(
        text:"Add to Cart",
        systemIconName: "handbag",
        width: 100,
        onTap: {
            print("Tapped")
        }
    )
}
