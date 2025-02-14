//
//  FlatFilterButtton.swift
//  M-Commerce-App
//
//  Created by Usef on 14/02/2025.
//

import SwiftUI

struct FlatFilterButton: View {
    var item: String
    var isSelected:Bool
    var body: some View {
        VStack {
            Text(item)
                .font(.system(size: 17, weight: .medium, design: .default))
                .foregroundStyle(isSelected ? .black : Color.gray)
                .frame(width: 150,height: 20)
            if isSelected {
                Rectangle()
                    .frame(width: 150, height: 1.8)
                    .font(.callout.weight(.light))
                    .foregroundStyle(ThemeManager.darkPuble)
            }else{
                Spacer()
            }
                    
        }.frame(width: 150, height: 21.8)
    }
}

#Preview {
    FlatFilterButton(item: "All Products", isSelected: true)
}
