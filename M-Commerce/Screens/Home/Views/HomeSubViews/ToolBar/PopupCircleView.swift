//
//  PopupCircleView.swift
//  M-Commerce
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI

struct PopupCircleView: View {
    var productCounter:Int
    let popupCircleDiameter:CGFloat = 12
    let popupCircleColor:Color      = .red
    var body: some View {
        if productCounter != 0 {
            Circle()
                .fill(popupCircleColor)
                .frame(width: popupCircleDiameter
                       , height: popupCircleDiameter)
                .overlay(alignment: .center
                         ,content: {
                    Text("\(productCounter)")
                        .foregroundStyle(.white)
                        .font(.system(size: 8))
                        .frame(width: popupCircleDiameter
                               , height: popupCircleDiameter)
                })
        }
    }
}

#Preview {
    PopupCircleView(productCounter: 9)
}
