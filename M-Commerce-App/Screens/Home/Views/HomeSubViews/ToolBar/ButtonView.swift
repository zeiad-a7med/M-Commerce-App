//
//  ButtonView.swift
//  M-Commerce
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI

struct ButtonView: View {
    var imageSystemName:String
    var itemCounter:Int = 0
    
    let cartTopPadding:CGFloat      = 3.0
    let cartTrailingPadding:CGFloat = 3.0
    var body: some View {
         
            Image(systemName: imageSystemName)
                .padding(.trailing, cartTrailingPadding)
                .padding(.top, cartTopPadding)
                .foregroundStyle(ThemeManager.navigationBarItemsColor)
                .overlay(alignment: .topTrailing
                         ,content: {
                    if(itemCounter > 0){
                        PopupCircleView(productCounter: itemCounter)
                    }
                    
                })
        
    }
}

#Preview {
    ButtonView(imageSystemName: "heart.fill", itemCounter: 10)
}
