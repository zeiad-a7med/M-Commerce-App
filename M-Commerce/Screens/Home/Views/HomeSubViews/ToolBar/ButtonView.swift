//
//  ButtonView.swift
//  M-Commerce
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI

struct ButtonView: View {
    var imageSystemName:String
    var itemCounter:Int
    
    let cartTopPadding:CGFloat      = 3.0
    let cartTrailingPadding:CGFloat = 3.0
    var body: some View {
        Button(action: {
            //navigate to cart
            
        }, label: {
            Image(systemName: imageSystemName)
                .padding(.trailing, cartTrailingPadding)
                .padding(.top, cartTopPadding)
                .foregroundStyle(navigationBarItemsColor)
                .overlay(alignment: .topTrailing
                         ,content: {
                    PopupCircleView(productCounter: itemCounter)
                })
        })
    }
}

#Preview {
    ButtonView(imageSystemName: "heart.fill", itemCounter: 10)
}
