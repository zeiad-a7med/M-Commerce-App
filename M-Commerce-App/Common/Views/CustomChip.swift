//
//  CustomChip.swift
//  M-Commerce-App
//
//  Created by Zeiad on 19/02/2025.
//

import SwiftUI

struct CustomChip: View {
    var isSelected: Bool = false
    var text: String
    @Binding var badgeNumber : Int?
    var onSelected: (() -> Void)?
    let unSelectedFilterColor = Color.white
    let selectedFilterColor = ThemeManager.darkPuble
    let unSelectedFilterTxtColor = Color.secondary
    let selectedFilterTxtColor = Color.white
    let paddingRadius:CGFloat = 8.0
    let shadowRadius:CGFloat = 5.0
    let cornerRadius:CGFloat = 15.0
    var body: some View {
        
        Button(action: {
            onSelected?()
        }, label: {
            Text(text)
                .font(.headline)
                .bold()
                .foregroundStyle(isSelected ?
                                 selectedFilterTxtColor : unSelectedFilterTxtColor)
                .padding(.horizontal,10)
                .frame(minHeight: 40, idealHeight: 40, maxHeight: 40, alignment: .center)
                .background(isSelected ?
                            selectedFilterColor : unSelectedFilterColor)
                .cornerRadius(cornerRadius)
                .shadow(radius: shadowRadius)
        })
        .overlay(alignment: .topTrailing){
            if(badgeNumber ?? 0 > 0){
                Circle()
                    .fill(isSelected ?
                          unSelectedFilterColor : selectedFilterColor)
                    .frame(width: 25,alignment: .topTrailing)
                    .overlay{
                        Text("\(badgeNumber ?? 0)")
                            .foregroundStyle(isSelected ?
                                             selectedFilterColor : unSelectedFilterColor)
                    }
                    .offset(x: 10, y: -10)
            }
        }
    }
}

#Preview {
    CustomChip(
        isSelected: false, text: "2 / M",
        badgeNumber: .constant(0)
    )
}
